import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:food_delivery/my_provider/home_view_provider.dart';
import 'package:food_delivery/widgets/order/loaded_order_view.dart';
import 'package:provider/provider.dart';

import 'generated/l10n.dart';
import 'my_provider/global_provider.dart';
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
    Provider.of<HomeViewProvider>(context, listen: false).getSuppliers();
    Provider.of<HomeViewProvider>(context, listen: false).getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        locale: Provider.of<GlobalProvider>(context).currentLocale,
        title: 'Delivery',
        theme: Provider.of<GlobalProvider>(context).currentTheme,
        routes: <String, WidgetBuilder>{
          '/': (BuildContext context) => const MainViewWidget(),
          '/product': (BuildContext context) {
            final id = ModalRoute.of(context)?.settings.arguments;
            if (id is int) {
              return ProductView(productId: id);
            } else {
              return const _ErrorMessageView(errorMessage: 'Error!!!');
            }
          },
          '/current_order': (BuildContext context) => const CurrentOrderView(),
          '/loaded_order': (BuildContext context) {
            final id = ModalRoute.of(context)?.settings.arguments;
            if (id is int) {
              return LoadedOrderView(id: id);
            } else {
              return const _ErrorMessageView(errorMessage: 'Error!!!');
            }
          },
        },
      );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return AdaptiveTheme(
  //     initial: AdaptiveThemeMode.light,
  //     light: kLightTheme,
  //     dark: kDarkTheme,
  //     builder: (light, dark) => MaterialApp(
  //       localizationsDelegates: const [
  //         S.delegate,
  //         GlobalMaterialLocalizations.delegate,
  //         GlobalWidgetsLocalizations.delegate,
  //         GlobalCupertinoLocalizations.delegate,
  //       ],
  //       supportedLocales: S.delegate.supportedLocales,
  //       locale: my_provider.of<GlobalProvider>(context).currentLocale,
  //       title: 'Delivery',
  //       theme: my_provider.of<GlobalProvider>(context).currentTheme,
  //       routes: <String, WidgetBuilder>{
  //         '/': (BuildContext context) => const MainViewWidget(),
  //         '/product': (BuildContext context) {
  //           final id = ModalRoute.of(context)?.settings.arguments;
  //           if (id is int) {
  //             return ProductView(productId: id);
  //           } else {
  //             return const _ErrorMessageView(errorMessage: 'Error!!!');
  //           }
  //         },
  //         '/current_order': (BuildContext context) => const CurrentOrderView(),
  //         '/loaded_order': (BuildContext context) {
  //           final id = ModalRoute.of(context)?.settings.arguments;
  //           if (id is int) {
  //             return LoadedOrderView(id: id);
  //           } else {
  //             return const _ErrorMessageView(errorMessage: 'Error!!!');
  //           }
  //         },
  //       },
  //     ),
  //   );
  // }
}

class _ErrorMessageView extends StatelessWidget {
  final String errorMessage;
  const _ErrorMessageView({Key? key, required this.errorMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(errorMessage),
      ),
    );
  }
}

