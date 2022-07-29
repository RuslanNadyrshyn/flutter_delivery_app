import 'package:flutter/material.dart';
import 'package:food_delivery/models/product.dart';
import 'package:food_delivery/widgets/basket_widgets.dart';

import '../generated/l10n.dart';

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
    Product(
        id: 3,
        name: "nameasdas asdasdasdasdasdasdas dasdasdasd",
        menuId: 2,
        price: 4.0,
        image: 'http://via.placeholder.com/150x150',
        type: 'type',
        ingredients: ['ingredients']),
    Product(
        id: 4,
        name: "nameasdas asdasdasdasdasdasdas dasdasdasd",
        menuId: 2,
        price: 4.0,
        image: 'http://via.placeholder.com/150x150',
        type: 'type',
        ingredients: ['ingredients']),
    Product(
        id: 5,
        name: "nameasdas asdasdasdasdasdasdas dasdasdasd",
        menuId: 2,
        price: 4.0,
        image: 'http://via.placeholder.com/150x150',
        type: 'type',
        ingredients: ['ingredients']),
    Product(
        id: 6,
        name: "nameasdas asdasdasdasdasdasdas dasdasdasd",
        menuId: 2,
        price: 4.0,
        image: 'http://via.placeholder.com/150x150',
        type: 'type',
        ingredients: ['ingredients']),
  ];
  double sum = 0.0;

  void countSum() {
    setState(() {
      sum = 0;
      for (var element in products) {
        sum += element.price;
      }
    });
  }

  void removeProduct(int id) {
    for (var prod in products) {
      if (prod.id == id) {
        setState(() {
          products.remove(prod);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    countSum();
    return Container(
      color: Theme.of(context).backgroundColor,
      width: double.infinity,
      child: Column(
        children: [
          Expanded(child: BasketListWidget(products: products)),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total: $sum',
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
