import 'package:flutter/material.dart';

final kLightTheme = ThemeData.light().copyWith(
  appBarTheme: const AppBarTheme(color: Colors.green),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.green,
    selectedItemColor: Colors.green[800]!,
    unselectedItemColor: Colors.white,
  ),
  backgroundColor: Colors.grey,
  cardTheme: const CardTheme(color: Colors.white),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.green[800]!),
    ),
  ),
  dividerColor: Colors.black,
);

final kDarkTheme = ThemeData.dark().copyWith(
  appBarTheme: const AppBarTheme(color: Color.fromRGBO(50, 50, 50, 1),),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color.fromRGBO(50, 50, 50, 1),
    selectedItemColor: Colors.green,
    unselectedItemColor: Colors.white70,
  ),
  cardTheme: const CardTheme(
    color: Color.fromRGBO(70, 70, 70, 1),
  ),
  backgroundColor: const Color.fromRGBO(120, 120, 120, 1),
  scaffoldBackgroundColor: const Color.fromRGBO(80, 80, 80, 1),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.green[900]!),
    ),
  ),
  dividerColor: Colors.white,
);
