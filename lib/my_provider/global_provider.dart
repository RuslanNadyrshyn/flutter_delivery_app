import 'package:flutter/material.dart';
import 'package:food_delivery/themes.dart';

class GlobalProvider extends ChangeNotifier {
  Locale currentLocale = const Locale('en');
  ThemeData currentTheme = kLightTheme;

  setLocale(Locale newLocale) {
    currentLocale = newLocale;
    notifyListeners();
  }

  switchTheme() {
    if (currentTheme == kLightTheme) {
      currentTheme = kDarkTheme;
    } else {
      currentTheme = kLightTheme;
    }
    notifyListeners();
  }
}


