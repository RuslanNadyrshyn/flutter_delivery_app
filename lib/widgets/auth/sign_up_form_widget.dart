import 'package:flutter/material.dart';
import 'package:food_delivery/my_provider/auth_provider.dart';
import 'package:food_delivery/widgets/text_field_widget.dart';
import 'package:provider/provider.dart';

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

  void _signUp() {
    final email = _emailTextController.text;
    final password = _passwordTextController.text;
    final name = _nameTextController.text;
    Provider.of<AuthProvider>(context, listen: false).signUp(name, email, password);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SignUpErrorMessageWidget(),
        TextFieldWidget(controller: _emailTextController, title: S.of(context).email,),
        const SizedBox(height: 15),
        TextFieldPasswordWidget(title: S.of(context).password, controller: _passwordTextController,),
        const SizedBox(height: 15),
        TextFieldWidget(controller: _nameTextController, title: S.of(context).name,),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: _signUp,
          style: ButtonStyle(
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
              )),
          child: Text(S.of(context).sign_up, style: const TextStyle(fontSize: 18),),
        ),
      ],
    );
  }
}


class _SignUpErrorMessageWidget extends StatelessWidget {
  const _SignUpErrorMessageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final errorMessage = Provider.of<AuthProvider>(context).signUpErrorMessage;

    if (errorMessage == null) return const SizedBox.shrink();
    return SizedBox(
      height: 20,
      child: Text(errorMessage, style: const TextStyle(color: Colors.red)),
    );
  }
}

