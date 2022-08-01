import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/models/order.dart';
import 'package:food_delivery/models/product.dart';
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

  final CurrentOrder order = CurrentOrder(
    user: User(email: '', name: '', id: 0),
    address: '',
    products: [
      Product(
        id: 1,
        name: "nameasdas asdasdasdasdasdasdas dasdasdasd",
        menuId: 2,
        price: 4.0,
        image: 'http://via.placeholder.com/150x150',
        type: 'type',
        ingredients: ['ingredients'],
      ),
      Product(
        id: 2,
        name: "nameasdas asdasdasdasdasdasdas dasdasdasd",
        menuId: 2,
        price: 322.0,
        image: 'http://via.placeholder.com/150x150',
        type: 'type',
        ingredients: ['ingredients'],
      ),
      Product(
        id: 1,
        name: "nameasda",
        menuId: 2,
        price: 4.0,
        image: 'http://via.placeholder.com/150x150',
        type: 'type',
        ingredients: ['ingredients'],
      ),
      Product(
        id: 2,
        name:
            "nameasdas asdasdasdasdasdasdas dasdaskjhgsdlkfjhgsldkfjglskdfjhslkdfjhslkdfjlksdfjlksdjfglksdjflkdjsflkjhdasd",
        menuId: 2,
        price: 322.0,
        image: 'http://via.placeholder.com/150x150',
        type: 'type',
        ingredients: ['ingredients'],
      ),
      Product(
        id: 1,
        name: "nameasdas asdasdasdasdasdasdas dasdasdasd",
        menuId: 2,
        price: 4.0,
        image: 'http://via.placeholder.com/150x150',
        type: 'type',
        ingredients: ['ingredients'],
      ),
      Product(
        id: 2,
        name: "nameasdas asdasdasdasdasdasdas dasdasdasd",
        menuId: 2,
        price: 3243242432.0,
        image: 'http://via.placeholder.com/150x150',
        type: 'type',
        ingredients: ['ingredients'],
      ),
    ],
    totalPrice: 432,
  );

  // void _removeProduct(int id) {
  void _makeOrder() {
    final name = _nameTextController.text;
    final address = _addressTextController.text;

    if (name.isNotEmpty && address.isNotEmpty) {
      errorText = null;
      print(
          '$name, your order has ${order.products.length} products');
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
        padding: EdgeInsets.all(10),
        children: [
          OrderListWidget(
            products: order.products,
          ),
          SizedBox(height: 15),
          Text(
            '${S.of(context).total}: ${order.totalPrice}',
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.end,
          ),
          // Create Widget
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //errorText


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
