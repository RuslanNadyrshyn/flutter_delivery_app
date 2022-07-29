import 'package:flutter/material.dart';

import '../generated/l10n.dart';
import '../widgets/products_widgets.dart';
import '../widgets/supplier_widgets.dart';

List<BottomNavigationBarItem> getBottomNavigationItems(BuildContext context) {
  return [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.home_rounded,
      ),
      label: S
          .of(context)
          .home,
    ),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.shopping_basket,
        ),
        label: S
            .of(context)
            .basket),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.settings,
        ),
        label: S
            .of(context)
            .settings),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.login,
        ),
        label: S
            .of(context)
            .login),
  ];
}

class HomeView extends StatelessWidget {
  static const String title = '';
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: const [
          SuppliersListWidget(),
          SizedBox(height: 20),
          ProductsListWidget(),
        ],
    );
  }
}
