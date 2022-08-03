import 'package:flutter/material.dart';
import 'package:food_delivery/models/order.dart';
import 'package:food_delivery/models/provider.dart';
import 'package:food_delivery/models/user.dart';
import 'package:food_delivery/widgets/text_field_widget.dart';
import 'package:provider/provider.dart';

import '../../../generated/l10n.dart';


class OrderFormWidget extends StatefulWidget {
  const OrderFormWidget({Key? key}) : super(key: key);

  @override
  State<OrderFormWidget> createState() => _OrderFormWidgetState();
}

class _OrderFormWidgetState extends State<OrderFormWidget> {
  final _nameTextController = TextEditingController();
  final _addressTextController = TextEditingController();
  String? errorText;

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

    if (order.address.isNotEmpty) {
      if (Provider.of<LocaleProvider>(context, listen: false).isAuthorized ||
          !Provider.of<LocaleProvider>(context, listen: false).isAuthorized &&
              order.user.name.isNotEmpty) {
        errorText = null;
        setState(() {});
        print(
            '${order.user.name}, your order has ${order.products.length} products');
        // make query to backend with name and address. get order id
        return;
      }
    }
    errorText = S.of(context).inputErrorText;
    Future.delayed(const Duration(seconds: 5), () {
      errorText = null;
      setState(() {});
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 26,
          child: errorText != null ? Text(errorText!) : null,
        ),
        if (!Provider.of<LocaleProvider>(context).isAuthorized) ...[
          TextFieldWidget(title: S.of(context).name, controller: _nameTextController,),
          SizedBox(height: 15),
        ],
        TextFieldWidget(title: S.of(context).address, controller: _addressTextController,),
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
    );
  }
}