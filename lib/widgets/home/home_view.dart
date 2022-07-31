import 'package:flutter/material.dart';

import 'product_widgets.dart';
import 'supplier_widgets.dart';

class HomeView extends StatelessWidget {
  static const String title = '';
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: Column(
        children: const [
          SuppliersListWidget(),
          SizedBox(height: 20),
          ProductsListWidget(),
        ],
      ),
    );
  }
}
