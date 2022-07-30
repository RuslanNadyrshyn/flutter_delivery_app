import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'generated/l10n.dart';
import 'views/basket_view.dart';
import 'views/home_view.dart';
import 'views/login_view.dart';
import 'views/profile_view.dart';
import 'views/settings_view.dart';


// main_widget
class WidgetOptions {
  AppBar appBar;
  Widget widget;

  WidgetOptions(this.appBar, this.widget);
}

List<WidgetOptions> getWidgetOptions (BuildContext context) {
  return [
    WidgetOptions(AppBar(title: Text(S.of(context).delivery),), HomeView()),
    WidgetOptions(AppBar(title: Text(S.of(context).basket),), BasketView()),
    WidgetOptions(AppBar(title: Text(S.of(context).settings),), SettingsView()),
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

  String selectedSupplierType = 'All';
  String selectedProductType = 'All';

  void setLocale(Locale newLocale) {
    currentLocale = newLocale;
    notifyListeners();
  }
  void authorize() {
    isAuthorized = !isAuthorized;
    notifyListeners();
  }
  void setSupplierType(String type) {
    selectedSupplierType = type;
    notifyListeners();
  }
  void setProductType(String type) {
    selectedProductType = type;
    notifyListeners();
  }

}

BoxDecoration cardBoxDecoration (BuildContext context) {
  return BoxDecoration(
      color: Theme.of(context).cardTheme.color,
      borderRadius: BorderRadius.all(Radius.circular(5)),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 10,
          offset: Offset(0, 2),
        ),
      ]);
}
BoxDecoration listBoxDecoration (BuildContext context) {
  return BoxDecoration(
      color: Theme.of(context).backgroundColor,
      borderRadius: BorderRadius.all(Radius.circular(5)),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 10,
          offset: Offset(0, 2),
        ),
      ]);
}