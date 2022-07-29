import 'package:flutter/material.dart';

import '../generated/l10n.dart';

class BasketView extends StatelessWidget {

  const BasketView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(
          S.of(context).basket,
        ),
      ),
      body: Center(child: Text('Profile')),
    );
  }
}