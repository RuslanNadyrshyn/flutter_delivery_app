import 'package:flutter/material.dart';
import 'package:food_delivery/models/product.dart';
import 'package:food_delivery/widgets/order/order_card_widget.dart';

class OrderListWidget extends StatelessWidget {
  final List<Product> products;

  const OrderListWidget({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      height: 350,
      child: Scrollbar(
        child: ListView(
            itemExtent: 80,
            children: (products
                .map((product) => OrderCardWidget(product: product))
                .toList())),
      ),
    );
  }
}


