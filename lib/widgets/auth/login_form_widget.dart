import 'package:flutter/material.dart';
import 'package:food_delivery/generated/l10n.dart';
import 'package:food_delivery/my_provider/auth_provider.dart';
import 'package:food_delivery/widgets/text_field_widget.dart';
import 'package:provider/provider.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({Key? key}) : super(key: key);

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final TextEditingController _emailTextController = TextEditingController(text: 'email@email.email');
  final TextEditingController _passwordTextController = TextEditingController(text: 'password');

  void _login() {
    final email = _emailTextController.text;
    final password = _passwordTextController.text;

    Provider.of<AuthProvider>(context, listen: false).login(email, password);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _AuthErrorMessageWidget(),
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

class _AuthErrorMessageWidget extends StatelessWidget {
  const _AuthErrorMessageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final errorMessage = Provider.of<AuthProvider>(context).authErrorMessage;

    if (errorMessage == null) return const SizedBox.shrink();
    return SizedBox(
      height: 20,
      child: Text(errorMessage, style: const TextStyle(color: Colors.red)),
    );
  }
}

