import 'package:flutter/material.dart';
import 'package:food_delivery/app.dart';
import 'package:food_delivery/views/settings_view.dart';
import 'package:provider/provider.dart';

void main() {
  const app = App();
  runApp(ChangeNotifierProvider(
      create: (_) => LocaleProvider(),
      child: app)
  );
}
