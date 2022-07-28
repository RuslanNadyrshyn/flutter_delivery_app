import 'package:flutter/material.dart';
import 'package:food_delivery/wrappers/drawer_wrapper.dart';

import '../generated/l10n.dart';

InputDecoration inputDecoration(context) {
  return InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    isCollapsed: true,
    enabledBorder: myInputBorder(context),
    focusedBorder: myFocusBorder(context),
    border: myInputBorder(context),
  );
}

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _signUp() {
      // go to sign up page
      Navigator.pushNamed(context, '/sign_up');
    }

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
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            _FormWidget(),
            SizedBox(height: 15,),
            Center(child: Text(S.of(context).sign_up_text, style: TextStyle(fontSize: 16),)),
            Center(child: ElevatedButton(onPressed: _signUp, child: Text(S.of(context).sign_up, style: TextStyle(fontSize: 18)))),
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

  void _login() {
    final email = _emailTextController.text;
    final password = _passwordTextController.text;

    if (email.length > 4 && password.length > 4) {
      // make query to backend with email and pass. If correct, get profile info
    }
  }

  @override
  Widget build(BuildContext context) {


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(S.of(context).email, style: TextStyle(fontSize: 16)),
        SizedBox(height: 5,),
        TextField(
          controller: _emailTextController,
          style: TextStyle(fontSize: 20),
          decoration: inputDecoration(context),
        ),
        SizedBox(height: 15,),
        Text(S.of(context).password, style: TextStyle(fontSize: 16)),
        SizedBox(height: 5,),
        TextField(
          controller: _passwordTextController,
          style: TextStyle(fontSize: 20),
          decoration: inputDecoration(context),
          obscureText: true,
        ),
        SizedBox(height: 10,),
        ElevatedButton(onPressed: () {}, child: Text(S.of(context).login, style: TextStyle(fontSize: 18),)),
      ],
    );
  }
}

OutlineInputBorder myInputBorder(BuildContext context){
  return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(
        color: Theme.of(context).dividerColor,
        width: 1,
      )
  );
}
OutlineInputBorder myFocusBorder(BuildContext context){
  return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(
        color: Theme.of(context).appBarTheme.backgroundColor!,
        width: 3,
      )
  );
}