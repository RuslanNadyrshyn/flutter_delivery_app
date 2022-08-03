import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/text_field_widget.dart';

import '../../generated/l10n.dart';

class SignUpFormWidget extends StatefulWidget {
  const SignUpFormWidget({Key? key}) : super(key: key);

  @override
  State<SignUpFormWidget> createState() => _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _nameTextController = TextEditingController();
  String? errorText;

  void _signUp() {
    final email = _emailTextController.text;
    final password = _passwordTextController.text;
    final name = _nameTextController.text;

    if (email.length >= 4 && password.length >= 4 && name.isNotEmpty) {
      errorText = null;
      // make query to backend with email and pass. If correct, get profile info
    } else {
      errorText = S.of(context).inputErrorText;
      Future.delayed(const Duration(seconds: 5), () {
        setState(() {
          errorText = null;
        });
      });
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20,
          child: errorText != null ? Text(errorText!) : null,
        ),
        TextFieldWidget(controller: _emailTextController, title: S.of(context).email,),
        SizedBox(height: 15),
        TextFieldPasswordWidget(title: S.of(context).password, controller: _passwordTextController,),
        SizedBox(height: 15),
        TextFieldWidget(controller: _nameTextController, title: S.of(context).name,),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: _signUp,
          style: ButtonStyle(
              padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(vertical: 12, horizontal: 15),
              )),
          child: Text(S.of(context).sign_up, style: TextStyle(fontSize: 18),),
        ),
      ],
    );
  }
}
