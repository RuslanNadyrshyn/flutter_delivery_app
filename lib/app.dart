import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:food_delivery/home_view.dart';
import 'package:food_delivery/themes.dart';

import 'generated/l10n.dart';



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
        locale: Locale.fromSubtags(languageCode: 'en'),
        title: 'Delivery',
        theme: light,
        home: HomeView(),
        routes: <String, WidgetBuilder> {
          '/home': (BuildContext context) => HomeView(),
          '/basket': (BuildContext context) => HomeView(),
          '/settings': (BuildContext context) => HomeView(),
          '/login': (BuildContext context) => HomeView(),
        },
      ),
    );
  }
}

