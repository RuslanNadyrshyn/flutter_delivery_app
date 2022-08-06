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
import 'widgets/product/product_view.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    Provider.of<GlobalProvider>(context, listen: false).getSuppliers();
    Provider.of<GlobalProvider>(context, listen: false).getProducts();
    super.initState();
  }

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
        locale: Provider.of<GlobalProvider>(context).currentLocale,
        title: 'Delivery',
        theme: light,
        routes: <String, WidgetBuilder>{
          '/': (BuildContext context) => const MainViewWidget(),
          '/product': (BuildContext context) {
            final id = ModalRoute.of(context)?.settings.arguments;
            if (id is int) {
              return ProductView(productId: id);
            } else {
              return const Text('Error!!!');
            }
          },
          '/current_order': (BuildContext context) => const CurrentOrderView(),
          '/loaded_order': (BuildContext context) => LoadedOrderView(),
        },
      ),
    );
  }
}
