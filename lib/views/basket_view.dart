import 'package:flutter/material.dart';
import 'package:food_delivery/models/product.dart';
import 'package:food_delivery/widgets/basket_widgets.dart';
import 'package:food_delivery/wrappers/drawer_wrapper.dart';

import '../generated/l10n.dart';

class BasketView extends StatefulWidget {

  const BasketView({Key? key}) : super(key: key);

  @override
  State<BasketView> createState() => _BasketViewState();
}

class _BasketViewState extends State<BasketView> {
  List<Product> products = [
    Product(id: 1,
      name: "nameasdas asdasdasdasdasdasdas dasdasdasd",
      menuId: 2,
      price: 4.0,
      image: 'http://via.placeholder.com/150x150',
      type: 'type',
      ingredients: ['ingredients']),
    Product(id: 2,
      name: "nameasdas asdasdasdasdasdasdas dasdasdasd",
      menuId: 2,
      price: 322.0,
      image: 'http://via.placeholder.com/150x150',
      type: 'type',
      ingredients: ['ingredients']),
    Product(id: 3,
      name: "nameasdas asdasdasdasdasdasdas dasdasdasd",
      menuId: 2,
      price: 4.0,
      image: 'http://via.placeholder.com/150x150',
      type: 'type',
      ingredients: ['ingredients']),
    Product(id: 4,
      name: "nameasdas asdasdasdasdasdasdas dasdasdasd",
      menuId: 2,
      price: 4.0,
      image: 'http://via.placeholder.com/150x150',
      type: 'type',
      ingredients: ['ingredients']),
    Product(id: 5,
      name: "nameasdas asdasdasdasdasdasdas dasdasdasd",
      menuId: 2,
      price: 4.0,
      image: 'http://via.placeholder.com/150x150',
      type: 'type',
      ingredients: ['ingredients']),
    Product(id: 6,
      name: "nameasdas asdasdasdasdasdasdas dasdasdasd",
      menuId: 2,
      price: 4.0,
      image: 'http://via.placeholder.com/150x150',
      type: 'type',
      ingredients: ['ingredients']),
  ];
  double sum = 0.0;
  
  double countSum() {
    setState(() {
      for (var element in products) {sum+=element.price;}
    });
    return sum;
  }
  void removeProduct(int id) {
    for(var prod in products) {
      if (prod.id == id) {
        setState(() {
          products.remove(prod);
        });
      }
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      drawer: DrawerWrapper(),
      appBar: AppBar(
        title: Center(
          child: Text(
            S.of(context).basket,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(child: BasketListWidget(products: products)),
          SizedBox(height: 5),
          Text(
            'Total: ${countSum()}',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 5),
          Container(
            width: double.infinity,
            height: 60,
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(S.of(context).to_order),
            ),
          ),
        ],
      ),
    );
  }
}
