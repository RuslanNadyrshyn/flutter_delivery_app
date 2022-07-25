import 'package:flutter/material.dart';
import 'package:food_delivery/wrappers/drawer_wrapper.dart';

import '../generated/l10n.dart';

class SettingsView extends StatelessWidget {

  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      drawer: DrawerWrapper(),
      appBar: AppBar(
        title: Text(
          S.of(context).settings,
        ),
      ),
      body: Center(child: Text('Settings')),
    );
  }
}