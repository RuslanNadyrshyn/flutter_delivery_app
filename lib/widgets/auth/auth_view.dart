import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/Auth/login_form_widget.dart';

import '../../generated/l10n.dart';
import 'sign_up_form_widget.dart';

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
    return ListView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
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
                      : Theme.of(context).bottomNavigationBarTheme.backgroundColor,
                  height: 50,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      S.of(context).login,
                      style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context)
                              .appBarTheme
                              .titleTextStyle
                              ?.color),
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
                      : Theme.of(context).bottomNavigationBarTheme.backgroundColor,
                  height: 50,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      S.of(context).sign_up,
                      style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context)
                              .appBarTheme
                              .titleTextStyle
                              ?.color),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 500,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: IndexedStack(
              index: _selectedTab,
              children: const [
                LoginFormWidget(),
                SignUpFormWidget(),
              ],
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _selectedTab == 0
                  ? S.of(context).sign_up_text
                  : S.of(context).login_text,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {
                _selectedTab == 0
                    ? _changeSelectedTab(1)
                    : _changeSelectedTab(0);
              },
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(vertical: 12, horizontal: 15),
              )),
              child: Text(
                _selectedTab == 0
                    ? S.of(context).sign_up
                    : S.of(context).login,
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 15),
          ],
        ),
      ],
    );
  }
}
