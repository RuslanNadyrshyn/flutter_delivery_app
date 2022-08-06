import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/text_field_widget.dart';
import 'package:provider/provider.dart';

import '../../generated/l10n.dart';
import '../../models/provider.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({Key? key}) : super(key: key);

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  String? errorText;

  void _login() {
    final email = _emailTextController.text;
    final password = _passwordTextController.text;

    if (email.length >= 4 && password.length >= 4) {
      errorText = null;
      if (email == 'admin' && password == 'admin') {
        Provider.of<GlobalProvider>(context, listen: false).authorize();
        print(Provider.of<GlobalProvider>(context, listen: false).isAuthorized);
      }
      // make query to backend with email and pass. If correct, get profile info
    } else {
      errorText = S.of(context).inputErrorText;
      Future.delayed(const Duration(seconds: 5), () {
        setState(() => errorText = null);
      });
    }
    setState(() =>{});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20,
          child: errorText != null ? Text(errorText!) : null,
        ),
        TextFieldWidget(title: S.of(context).email, controller: _emailTextController, ),
        const SizedBox(height: 15),
        TextFieldPasswordWidget(title: S.of(context).password, controller: _passwordTextController,),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
            onPressed: _login,
            style: ButtonStyle(
                padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            )),
            child: Text(
              S.of(context).login,
              style: const TextStyle(fontSize: 18),
            )),
      ],
    );
  }
}
