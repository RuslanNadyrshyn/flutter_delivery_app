import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:food_delivery/themes.dart';
import 'package:provider/provider.dart';

import 'constants.dart';
import 'generated/l10n.dart';
import 'views/main_widget.dart';
import 'views/basket_view.dart';
import 'views/login_view.dart';
import 'views/product_view.dart';
import 'views/settings_view.dart';
import 'views/sign_up_view.dart';


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
        // home: MainViewWidget(),
        routes: <String, WidgetBuilder> {
          '/': (BuildContext context) => MainViewWidget(),
          '/basket': (BuildContext context) => BasketView(),
          '/settings': (BuildContext context) => SettingsView(),
          '/login': (BuildContext context) => LoginView(),
          '/sign_up': (BuildContext context) => SignUpView(),
          '/product': (BuildContext context) => ProductView(),
        },
      ),
    );
  }
}

