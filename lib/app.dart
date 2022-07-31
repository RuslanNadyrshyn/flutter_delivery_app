import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:food_delivery/themes.dart';
import 'package:provider/provider.dart';

import 'generated/l10n.dart';
import 'models/provider.dart';
import 'widgets/auth/auth_view.dart';
import 'widgets/main_widget.dart';
import 'widgets/basket/basket_view.dart';
import 'views/product_view.dart';
import 'widgets/settings/settings_view.dart';

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
          '/basket': (BuildContext context) => BasketView(),
          '/settings': (BuildContext context) => SettingsView(),
          '/auth': (BuildContext context) => AuthView(),
          '/product': (BuildContext context) => ProductView(),
        },
      ),
    );
  }
}

