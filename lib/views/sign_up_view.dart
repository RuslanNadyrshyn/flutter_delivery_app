import 'package:flutter/material.dart';

import '../constants.dart';
import '../generated/l10n.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _signUp() {
      Navigator.pushNamed(context, '/');
    }

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Center(
          child: Text(
            S.of(context).sign_up,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(
              height: 20,
            ),
            _FormWidget(),
          ],
        ),
      ),
    );
  }
}

class _FormWidget extends StatefulWidget {
  const _FormWidget({Key? key}) : super(key: key);

  @override
  State<_FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<_FormWidget> {
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _nameTextController = TextEditingController();
  bool _passwordHidden = true;
  String? errorText = null;

  void _changePasswordVisibility() {
    setState(() {
      _passwordHidden = !_passwordHidden;
    });
  }

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
        if (errorText != null) ...[
          Text(errorText!),
          SizedBox(height: 10),
        ],
        Text(S.of(context).email, style: TextStyle(fontSize: 16)),
        SizedBox(height: 5),
        TextField(
          controller: _emailTextController,
          style: TextStyle(fontSize: 20),
          decoration: inputDecoration(context),
        ),
        SizedBox(height: 15),
        Text(S.of(context).password, style: TextStyle(fontSize: 16)),
        SizedBox(height: 5),
        TextField(
          controller: _passwordTextController,
          style: TextStyle(fontSize: 20),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            isCollapsed: true,
            enabledBorder: myInputBorder(context),
            focusedBorder: myFocusBorder(context),
            border: myInputBorder(context),
            suffixIcon: IconButton(
                splashRadius: 15,
                onPressed: _changePasswordVisibility,
                icon: _passwordHidden
                    ? Icon(Icons.visibility_off_rounded)
                    : Icon(Icons.visibility)),
          ),
          obscureText: _passwordHidden,
        ),
        SizedBox(height: 15),
        Text(S.of(context).name, style: TextStyle(fontSize: 16)),
        SizedBox(height: 5),
        TextField(
          controller: _nameTextController,
          style: TextStyle(fontSize: 20),
          decoration: inputDecoration(context),
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: _signUp,
          child: Text(
            S.of(context).sign_up,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
