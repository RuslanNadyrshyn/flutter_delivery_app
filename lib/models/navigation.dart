import 'package:flutter/material.dart';
import 'package:food_delivery/models/provider.dart';
import 'package:provider/provider.dart';

import '../generated/l10n.dart';
import '../widgets/auth/auth_view.dart';
import '../widgets/basket/basket_view.dart';
import '../widgets/home/home_view.dart';
import '../widgets/profile/profile_view.dart';
import '../widgets/settings/settings_view.dart';

class WidgetOptions {
  AppBar appBar;
  Widget widget;

  WidgetOptions(this.appBar, this.widget);
}

List<WidgetOptions> getWidgetOptions (BuildContext context) {
  return [
    WidgetOptions(AppBar(title: Text(S.of(context).delivery),), const HomeView()),
    WidgetOptions(AppBar(title: Text(S.of(context).basket),), const BasketView()),
    WidgetOptions(AppBar(title: Text(S.of(context).settings),), const SettingsView()),
    Provider.of<GlobalProvider>(context, listen: false).isAuthorized ?
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
              Provider.of<GlobalProvider>(context, listen: false).authorize();
            }
          }
      ),
    ],), const ProfileView()) :
    WidgetOptions(AppBar(title: Text(S.of(context).login),), const AuthView()),
  ];
}

List<BottomNavigationBarItem> getBottomNavigationItems(BuildContext context) {
  return [
    BottomNavigationBarItem(
        icon: const Icon(Icons.home_rounded),
        label: S.of(context).delivery),
    BottomNavigationBarItem(
        icon: const Icon(Icons.shopping_basket),
        label: S.of(context).basket),
    BottomNavigationBarItem(
        icon: const Icon(Icons.settings),
        label: S.of(context).settings),
    Provider.of<GlobalProvider>(context).isAuthorized ?
    BottomNavigationBarItem(icon: const Icon(Icons.person_rounded), label: S.of(context).profile)
        : BottomNavigationBarItem(icon: const Icon(Icons.login), label: S.of(context).login),
  ];
}