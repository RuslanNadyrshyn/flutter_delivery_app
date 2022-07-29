import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'generated/l10n.dart';


// main_widget
class WidgetOptions {
  AppBar appBar;
  Widget widget;

  WidgetOptions(this.appBar, this.widget);
}

List<BottomNavigationBarItem> getBottomNavigationItems(BuildContext context) {
  return [
    BottomNavigationBarItem(
        icon: Icon(Icons.home_rounded),
        label: S.of(context).delivery),
    BottomNavigationBarItem(
        icon: Icon(Icons.shopping_basket),
        label: S.of(context).basket),
    BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: S.of(context).settings),
    Provider.of<LocaleProvider>(context).isAuthorized ?
    BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: S.of(context).profile)
        : BottomNavigationBarItem(icon: Icon(Icons.login), label: S.of(context).login),
  ];
}

// Login_view
InputDecoration inputDecoration(context) {
  return InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    isCollapsed: true,
    enabledBorder: myInputBorder(context),
    focusedBorder: myFocusBorder(context),
    border: myInputBorder(context),
  );
}

OutlineInputBorder myInputBorder(BuildContext context) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(
        color: Theme.of(context).dividerColor,
        width: 1,
      ));
}
OutlineInputBorder myFocusBorder(BuildContext context) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(
        color: Theme.of(context).dividerColor,
        width: 3,
      ));
}



class LocaleProvider extends ChangeNotifier {
  Locale currentLocale = Locale('en');
  bool isAuthorized = false;

  void setLocale(Locale newLocale) {
    currentLocale = newLocale;
    notifyListeners();
  }
  void authorize() {
    isAuthorized = !isAuthorized;
    notifyListeners();
  }
}