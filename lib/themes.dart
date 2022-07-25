import 'package:flutter/material.dart';

final kLightTheme = ThemeData.light().copyWith(
  appBarTheme: AppBarTheme(color: Colors.green),
  backgroundColor: Colors.greenAccent,
  cardTheme: CardTheme(color: Colors.teal),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.green[800]!),
  )),
);

final kDarkTheme = ThemeData.dark().copyWith(
  appBarTheme: AppBarTheme(color: Colors.brown),
  backgroundColor: Colors.black12,
  cardTheme: CardTheme(color: Colors.black54),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
  )),
);
