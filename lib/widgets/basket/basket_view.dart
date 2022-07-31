import 'package:flutter/material.dart';
import 'package:food_delivery/models/product.dart';


import '../../generated/l10n.dart';
import 'basket_list_widget.dart';

class BasketView extends StatefulWidget {
  const BasketView({Key? key}) : super(key: key);

  @override
  State<BasketView> createState() => _BasketViewState();
}

class _BasketViewState extends State<BasketView> {
  List<Product> products = [
    Product(
        id: 1,
        name: "nameasdas asdasdasdasdasdasdas dasdasdasd",
        menuId: 2,
        price: 4.0,
        image: 'http://via.placeholder.com/150x150',
        type: 'type',
        ingredients: ['ingredients']),
    Product(
        id: 2,
        name: "nameasdas asdasdasdasdasdasdas dasdasdasd",
        menuId: 2,
        price: 322.0,
        image: 'http://via.placeholder.com/150x150',
        type: 'type',
        ingredients: ['ingredients']),
  ];
  double sum = 0.0;

  void _countSum() {
    setState(() {
      sum = 0;
      for (var element in products) {
        sum += element.price;
      }
    });
  }

  // void _removeProduct(int id) {
  //   for (var prod in products) {
  //     if (prod.id == id) {
  //       setState(() {
  //         products.remove(prod);
  //       });
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    _countSum();
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Expanded(child: BasketListWidget(products: products)),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${S.of(context).total}: $sum',
                  style: TextStyle(fontSize: 24),
                ),
                ElevatedButton(
                  style: ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.all(10))),
                  onPressed: () {},
                  child: Text(S.of(context).to_order, style: TextStyle(fontSize: 20),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


