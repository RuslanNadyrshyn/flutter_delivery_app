import 'package:flutter/material.dart';
import 'package:food_delivery/wrappers/drawer_wrapper.dart';

import '../generated/l10n.dart';
import '../widgets/products_widgets.dart';
import '../widgets/supplier_widgets.dart';

class HomeView extends StatelessWidget {

  const HomeView({Key? key}) : super(key: key);

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
        children: const [
          SizedBox(height: 20),
          SuppliersListWidget(),
          SizedBox(height: 20),
          ProductsListWidget(),
        ],
      ),
    );
  }
}
