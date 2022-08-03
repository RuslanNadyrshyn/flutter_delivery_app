import 'package:flutter/material.dart';

import 'product_list_widget.dart';
import 'supplier_list_widget.dart';

class HomeView extends StatelessWidget {
  static const String title = '';
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SuppliersListWidget(),
        SizedBox(height: 15),
        ProductsListWidget(),
      ],
    );
  }
}
