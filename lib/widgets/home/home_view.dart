import 'package:flutter/material.dart';
import 'package:food_delivery/models/provider.dart';
import 'package:provider/provider.dart';

import 'product_list_widget.dart';
import 'supplier_list_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    Provider.of<LocaleProvider>(context, listen: false).getSuppliers();
    Provider.of<LocaleProvider>(context, listen: false).getProducts();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SuppliersListWidget(),
        SizedBox(height: 10),
        ProductsListWidget(),
      ],
    );
  }
}



