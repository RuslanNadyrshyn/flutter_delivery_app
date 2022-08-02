import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/models/order.dart';
import 'package:food_delivery/models/provider.dart';
import 'package:food_delivery/models/user.dart';
import 'package:food_delivery/widgets/order/order_list_widget.dart';
import 'package:provider/provider.dart';

import '../../../generated/l10n.dart';

class CurrentOrderView extends StatefulWidget {
  const CurrentOrderView({Key? key}) : super(key: key);

  @override
  State<CurrentOrderView> createState() => _CurrentOrderViewState();
}

class _CurrentOrderViewState extends State<CurrentOrderView> {
  final _nameTextController = TextEditingController();
  final _addressTextController = TextEditingController();
  String? errorText;
  double totalPrice = 0;

  void _makeOrder() {
    CurrentOrder order = CurrentOrder(
      user: User(
        id: 0,
        name: _nameTextController.text,
        email: '',
      ),
      totalPrice: countTotal(
          Provider.of<LocaleProvider>(context, listen: false).basket),
      address: _addressTextController.text,
      products: Provider.of<LocaleProvider>(context, listen: false).basket,
    );

    if (order.user.name.isNotEmpty && order.address.isNotEmpty) {
      errorText = null;
      print(
          '${order.user.name}, your order has ${order.products.length} products');
      // make query to backend with name and address. get order id
    } else {
      errorText = S.of(context).inputErrorText;
      Future.delayed(const Duration(seconds: 5), () {
        setState(() {
          errorText = null;
        });
      });
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: EdgeInsets.all(10),
        children: [
          OrderListWidget(
            products: Provider.of<LocaleProvider>(context).basket,
          ),
          SizedBox(height: 15),
          Text(
            '${S.of(context).total}: ${countTotal(Provider.of<LocaleProvider>(context).basket).toStringAsFixed(2)}',
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.end,
          ),
          // Create Widget
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (errorText != null) ...[
                Text(errorText!),
                SizedBox(height: 10),
              ] else
                SizedBox(height: 26),
              if (!Provider.of<LocaleProvider>(context).isAuthorized) ...[
                Text(S.of(context).name, style: TextStyle(fontSize: 16)),
                SizedBox(height: 5),
                TextField(
                  cursorColor: Theme.of(context).dividerColor,
                  controller: _nameTextController,
                  style: TextStyle(fontSize: 20),
                  decoration: inputDecoration(context),
                ),
                SizedBox(height: 15),
              ],
              Text(S.of(context).address, style: TextStyle(fontSize: 16)),
              SizedBox(height: 5),
              TextField(
                cursorColor: Theme.of(context).dividerColor,
                controller: _addressTextController,
                style: TextStyle(fontSize: 20),
                decoration: inputDecoration(context),
              ),
              SizedBox(height: 15),
              Center(
                child: ElevatedButton(
                  onPressed: _makeOrder,
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                  )),
                  child: Text(
                    S.of(context).make_order,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
