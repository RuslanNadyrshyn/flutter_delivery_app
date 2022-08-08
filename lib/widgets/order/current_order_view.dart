import 'package:flutter/material.dart';
import 'package:food_delivery/my_provider/auth_provider.dart';
import 'package:food_delivery/my_provider/basket_provider.dart';
import 'package:food_delivery/my_provider/order_provider.dart';
import 'package:food_delivery/widgets/order/order_form_widget.dart';
import 'package:food_delivery/widgets/order/order_list_widget.dart';
import 'package:food_delivery/widgets/total_price_widget.dart';
import 'package:provider/provider.dart';


class CurrentOrderView extends StatelessWidget {
  const CurrentOrderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (Provider.of<OrderProvider>(context, listen: false).orderId != null) {
              Provider.of<OrderProvider>(context, listen: false).nullOrderId();
              Provider.of<BasketProvider>(context, listen: false).clearBasket();

              if(Provider.of<AuthProvider>(context, listen: false).isAuthorized) {
                print('update profile info');
                Provider.of<AuthProvider>(context, listen: false).getUserProfile();
              }
            }
            Navigator.of(context).pop();
          },
        ),
        title: const Text("Order"),
        centerTitle: true,
      ),
      body: ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: const EdgeInsets.all(10),
        children: [
          OrderListWidget(
            products: Provider.of<BasketProvider>(context).basket,
          ),
          const SizedBox(height: 15),
          const TotalPriceWidget(textAlign: TextAlign.end),
          const OrderFormWidget(),
        ],
      ),
    );
  }
}

