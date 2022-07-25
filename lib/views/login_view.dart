import 'package:flutter/material.dart';
import 'package:food_delivery/wrappers/drawer_wrapper.dart';

import '../generated/l10n.dart';

class LoginView extends StatelessWidget {

  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      drawer: DrawerWrapper(),
      appBar: AppBar(
        title: Center(
          child: Text(
            S.of(context).login,
          ),
        ),
      ),
      body: Center(child: Text('Login')),
    );
  }
}