import 'package:flutter/material.dart';
import 'package:food_delivery/home_view.dart';



class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delivery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeView(),
      // const MyHomePage(
      //   title: 'Delivery',
      //   // suppliers: [
      //   //   Supplier('Burger Club', '11:00-21:00'),
      //   //   Supplier('Pizza Club', '10:00-23:00'),
      //   // ],
      // ),
    );
  }
}

