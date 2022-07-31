import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../generated/l10n.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({Key? key}) : super(key: key);

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  void _login() {
    final email = _emailTextController.text;
    final password = _passwordTextController.text;

    if (email == 'admin' && password == 'admin') {
      Provider.of<LocaleProvider>(context, listen: false).authorize();
      print(Provider.of<LocaleProvider>(context, listen: false).isAuthorized);
    }
    //   // make query to backend with email and pass. If correct, get profile info
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(S.of(context).email, style: TextStyle(fontSize: 16)),
      SizedBox(
        height: 5,
      ),
      TextField(
        cursorColor: Theme.of(context).dividerColor,
        controller: _emailTextController,
        style: TextStyle(fontSize: 20),
        decoration: inputDecoration(context),
      ),
      SizedBox(
        height: 15,
      ),
      Text(S.of(context).password, style: TextStyle(fontSize: 16)),
      SizedBox(
        height: 5,
      ),
      TextField(
        cursorColor: Theme.of(context).dividerColor,
        controller: _passwordTextController,
        style: TextStyle(fontSize: 20),
        decoration: inputDecoration(context),
        obscureText: true,
      ),
      SizedBox(
        height: 10,
      ),
      ElevatedButton(
          onPressed: _login,
          child: Text(
            S.of(context).login,
            style: TextStyle(fontSize: 18),
          )),
    ],
    );
  }
}
