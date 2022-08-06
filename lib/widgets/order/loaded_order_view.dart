import 'package:flutter/material.dart';
import 'package:food_delivery/models/order.dart';
import 'package:food_delivery/models/product.dart';
import 'package:food_delivery/widgets/order/order_list_widget.dart';
import 'package:food_delivery/widgets/total_price_widget.dart';

class LoadedOrderView extends StatelessWidget {
  final OrderResponse order = OrderResponse(
    id: 1,
    userId: 1,
    address: 'address',
    price: 213,
    products: [
      Product(
        id: 1,
        name: "nameasdas asdasdasdasdasdasdas dasdasdasd",
        menuId: 2,
        price: 7.0,
        image: 'http://via.placeholder.com/150x150',
        type: 'type',
        ingredients: ['ingredients'],
        counter: 1,
      ),
      Product(
        id: 1,
        name: "nameasdas asdasdasdasdasdasdas dasdasdasd",
        menuId: 2,
        price: 7.0,
        image: 'http://via.placeholder.com/150x150',
        type: 'type',
        ingredients: ['ingredients'],
        counter: 1,
      ),
      Product(
        id: 1,
        name: "nameasdas asdasdasdasdasdasdas dasdasdasd",
        menuId: 2,
        price: 7.0,
        image: 'http://via.placeholder.com/150x150',
        type: 'type',
        ingredients: ['ingredients'],
        counter: 1,
      ),
    ],
    date: '21:21;20',
  );

  LoadedOrderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Order ${order.id}'),),
      body: ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: const EdgeInsets.all(10),
        children: [
          OrderListWidget(
            products: order.products,
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Text(order.date),
              const Expanded(
                child: TotalPriceWidget(textAlign: TextAlign.end),
              ),
            ],
          ),
          // Create Widget
        ],
      ),
    );
  }
}
