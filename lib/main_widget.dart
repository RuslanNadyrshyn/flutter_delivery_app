import 'package:flutter/material.dart';

import 'generated/l10n.dart';
import 'views/basket_view.dart';
import 'views/home_view.dart';
import 'views/login_view.dart';
import 'views/settings_view.dart';

class MainViewWidget extends StatefulWidget {
  const MainViewWidget({Key? key}) : super(key: key);

  @override
  State<MainViewWidget> createState() => _MainViewWidgetState();
}

class WidgetOptions {
  String appBarTitle;
  Widget widget;

  WidgetOptions(this.appBarTitle, this.widget);
}

List<WidgetOptions> getWidgetOptions(BuildContext context) {
  return [
    WidgetOptions(S.of(context).home, HomeView()),
    WidgetOptions(S.of(context).basket, BasketView()),
    WidgetOptions(S.of(context).settings, SettingsView()),
    WidgetOptions(S.of(context).login, LoginView()),
  ];
}

class _MainViewWidgetState extends State<MainViewWidget> {
  int _selectedTab = 0;

  void _changeSelectedTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<WidgetOptions> widgetOptions = getWidgetOptions(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widgetOptions[_selectedTab].appBarTitle),
      ),
      body: Container(
        color: Theme.of(context).backgroundColor,
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(5, 20, 5, 0),
        child: widgetOptions[_selectedTab].widget,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: _changeSelectedTab,
        type: BottomNavigationBarType.fixed,
        items: getBottomNavigationItems(context),
      ),
    );
  }
}
