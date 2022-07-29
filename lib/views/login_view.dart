import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../generated/l10n.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          _LoginFormWidget(),
          SizedBox(
            height: 15,
          ),
          _SignUpButtonWidget(),
        ],
      ),
    );
  }
}

class _LoginFormWidget extends StatefulWidget {
  const _LoginFormWidget({Key? key}) : super(key: key);

  @override
  State<_LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<_LoginFormWidget> {
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

class _SignUpButtonWidget extends StatelessWidget {
  const _SignUpButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _signUp() {
      Navigator.pushNamed(context, '/sign_up');
    }
    return Center(
      child: Column(
        children: [
          Text(
            S.of(context).sign_up_text,
            style: TextStyle(fontSize: 16),
          ),
          ElevatedButton(
              onPressed: _signUp,
              child: Text(S.of(context).sign_up, style: TextStyle(fontSize: 18))),
        ],
      ),
    );
  }
}
