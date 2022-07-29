import 'package:flutter/material.dart';
import 'package:food_delivery/views/profile_view.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../generated/l10n.dart';
import 'basket_view.dart';
import 'home_view.dart';
import 'login_view.dart';
import 'settings_view.dart';

class MainViewWidget extends StatefulWidget {
  const MainViewWidget({Key? key}) : super(key: key);

  @override
  State<MainViewWidget> createState() => _MainViewWidgetState();
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
    List<WidgetOptions> widgetOptions = [
      WidgetOptions(AppBar(title: Text(S.of(context).delivery),), HomeView()),
      WidgetOptions(AppBar(title: Text(S.of(context).basket),), BasketView()),
      WidgetOptions(AppBar(title: Text(S.of(context).settings),), SettingsView()),
      // WidgetOptions(S.of(context).login, LoginView()),
      Provider.of<LocaleProvider>(context, listen: false).isAuthorized ?
      WidgetOptions(AppBar(title: Text(S.of(context).profile), actions: [
        PopupMenuButton(
            itemBuilder: (context){
              return [
                PopupMenuItem<int>(
                  value: 0,
                  child: Text(S.of(context).logout),
                ),
              ];
            },
            onSelected:(value){
              if (value == 0){
                Provider.of<LocaleProvider>(context, listen: false).authorize();
              }
            }
        ),
      ],), ProfileView()) :
      WidgetOptions(AppBar(title: Text(S.of(context).login),), LoginView()),
    ];
    return Scaffold(
      appBar: widgetOptions[_selectedTab].appBar,
      body: Container(
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
