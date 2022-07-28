import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:food_delivery/themes.dart';

import 'generated/l10n.dart';
import 'views/home_view.dart';
import 'views/basket_view.dart';
import 'views/login_view.dart';
import 'views/settings_view.dart';


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
        locale: Locale.fromSubtags(languageCode: 'ru'),
        title: 'Delivery',
        theme: light,
        home: HomeView(),
        routes: <String, WidgetBuilder> {
          '/home': (BuildContext context) => HomeView(),
          '/basket': (BuildContext context) => BasketView(),
          '/settings': (BuildContext context) => SettingsView(),
          '/login': (BuildContext context) => LoginView(),
        },
      ),
    );
  }
}

