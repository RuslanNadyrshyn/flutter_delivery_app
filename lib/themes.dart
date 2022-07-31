import 'package:flutter/material.dart';

final kLightTheme = ThemeData.light().copyWith(
  appBarTheme: AppBarTheme(color: Colors.green),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.green,
    selectedItemColor: Colors.green[800]!,
    unselectedItemColor: Colors.white,
  ),
  backgroundColor: Colors.green,
  scaffoldBackgroundColor: Colors.greenAccent,
  cardTheme: CardTheme(color: Colors.greenAccent),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.green[800]!),
  )),
  dividerColor: Colors.black,
);

final kDarkTheme = ThemeData.dark().copyWith(
  appBarTheme: AppBarTheme(color: Colors.white12),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Colors.green,
    unselectedItemColor: Colors.white70,
  ),
  cardTheme: CardTheme(color: Colors.black54),
  backgroundColor: Colors.white30,
  // scaffoldBackgroundColor: Colors.white12,
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.green[900]!),
  )),
  dividerColor: Colors.white,
);
