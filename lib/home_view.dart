import 'package:flutter/material.dart';
import 'package:food_delivery/wrappers/drawer_wrapper.dart';

import 'generated/l10n.dart';
import 'models.dart';
import 'widgets.dart';

class HomeView extends StatelessWidget {
  final List<String> supTypes = [
    'All',
    'Open',
    'Pizzeria',
    'Caffe',
  ];
  final List<Supplier> suppliers = [
    Supplier('Burger Club', '11:00', '21:00'),
    Supplier('Pizza Club', '10:00', '23:00'),
    Supplier('Sushi', '10:00', '23:00'),
  ];

  final List<String> productTypes = [
    'All',
    'Pizza',
    'Burger',
  ];
  final List<Product> products = [
    Product('pizza1', 2.4, 'img'),
    Product('pizza2', 2.4, 'img'),
    Product('pizza3', 2.4, 'img'),
    Product('burger1', 2.4, 'img'),
    Product('burger3', 2.4, 'img'),
    Product('burger4', 2.4, 'img'),
    Product('sushi1', 2.4, 'img'),
    Product('sushi2', 2.4, 'img'),
    Product('sushi3', 2.4, 'img'),
  ];

  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      drawer: DrawerWrapper(),
      appBar: AppBar(
        title: Text(
          S.of(context).app_bar_title,
        ),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 20),
          TypesWidget(types: supTypes),
          SuppliersListWidget(suppliers: suppliers),
          const SizedBox(height: 20),
          TypesWidget(types: productTypes),
          ProductsListWidget(products: products),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
