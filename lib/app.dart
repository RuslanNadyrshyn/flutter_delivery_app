import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:food_delivery/themes.dart';
import 'package:food_delivery/widgets/order/loaded_order_view.dart';
import 'package:provider/provider.dart';

import 'generated/l10n.dart';
import 'models/provider.dart';
import 'widgets/order/current_order_view.dart';
import 'widgets/main_widget.dart';
import 'views/product_view.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      initial: AdaptiveThemeMode.light,
      light: kLightTheme,
      dark: kDarkTheme,
      builder: (light, dark) => MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        locale: Provider.of<LocaleProvider>(context).currentLocale,
        title: 'Delivery',
        theme: light,
        routes: <String, WidgetBuilder> {
          '/': (BuildContext context) => MainViewWidget(),
          '/product': (BuildContext context) => ProductView(),
          '/current_order': (BuildContext context) => CurrentOrderView(),
          '/loaded_order': (BuildContext context) => LoadedOrderView(),
        },
      ),
    );
  }
}

