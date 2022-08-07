import 'package:flutter/material.dart';
import 'package:food_delivery/app.dart';
import 'package:food_delivery/my_provider/auth_provider.dart';
import 'package:food_delivery/my_provider/basket_provider.dart';
import 'package:food_delivery/my_provider/global_provider.dart';
import 'package:food_delivery/my_provider/home_view_provider.dart';
import 'package:food_delivery/my_provider/product_page_provider.dart';
import 'package:provider/provider.dart';

void main() {
  const app = App();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<GlobalProvider>(create: (_) => GlobalProvider()),
        ChangeNotifierProvider<BasketProvider>(create: (_) => BasketProvider()),
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
        ChangeNotifierProvider<ProductPageInfoProvider>(
          create: (_) => ProductPageInfoProvider(),
        ),
        ChangeNotifierProvider<HomeViewProvider>(
            create: (_) => HomeViewProvider()),
      ],
      child: app,
    ),
  );
}
