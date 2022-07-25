import 'package:flutter/material.dart';
import 'package:food_delivery/wrappers/drawer_wrapper.dart';

import '../generated/l10n.dart';

class BasketView extends StatelessWidget {

  const BasketView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      drawer: DrawerWrapper(),
      appBar: AppBar(
        title: Text(
          S.of(context).basket,
        ),
      ),
      body: Center(child: Text('Profile')),
    );
  }
}