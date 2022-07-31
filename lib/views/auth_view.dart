import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/Auth/login_form_widget.dart';

import '../widgets/Auth/sign_up_form_widget.dart';

class AuthView extends StatefulWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  int _selectedTab = 0;

  void _changeSelectedTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(Theme.of(context).appBarTheme.backgroundColor);
    print(Theme.of(context).scaffoldBackgroundColor);
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  _changeSelectedTab(0);
                },
                child: Ink(
                  color: _selectedTab == 0
                      ? Theme.of(context).scaffoldBackgroundColor
                      : Theme.of(context).appBarTheme.backgroundColor,
                  height: 50,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).appBarTheme.titleTextStyle?.color
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  _changeSelectedTab(1);
                },
                child: Ink(
                  color: _selectedTab == 1
                      ? Theme.of(context).scaffoldBackgroundColor
                      : Theme.of(context).appBarTheme.backgroundColor,
                  height: 50,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 20,
                        color:  Theme.of(context).appBarTheme.titleTextStyle?.color
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(16),
          child: IndexedStack(
            index: _selectedTab,
            children: const [
              LoginFormWidget(),
              SignUpFormWidget(),
            ],
          ),
        ),
      ],
    );
  }
}
