import 'package:flutter/material.dart';
import 'package:food_delivery/my_provider/basket_provider.dart';
import 'package:food_delivery/widgets/order/order_form_widget.dart';
import 'package:food_delivery/widgets/order/order_list_widget.dart';
import 'package:food_delivery/widgets/total_price_widget.dart';
import 'package:provider/provider.dart';


class CurrentOrderView extends StatelessWidget {
  const CurrentOrderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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

