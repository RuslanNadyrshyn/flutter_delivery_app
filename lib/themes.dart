import 'package:flutter/material.dart';

final kLightTheme = ThemeData.light().copyWith(
  appBarTheme: AppBarTheme(color: Colors.green),
  backgroundColor: Colors.greenAccent,
  cardTheme: CardTheme(color: Colors.teal),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.green[800]!),
  )),
  dividerColor: Colors.black,
);

final kDarkTheme = ThemeData.dark().copyWith(
  appBarTheme: AppBarTheme(color: Colors.brown),
  backgroundColor: Colors.brown[800],
  cardTheme: CardTheme(color: Colors.black54),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.green[900]!),
  )),
  dividerColor: Colors.white,
);
