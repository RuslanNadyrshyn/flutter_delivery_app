import 'package:flutter/material.dart';
import 'package:food_delivery/http_service/order_http.dart';
import 'package:food_delivery/models/order.dart';
import 'package:food_delivery/widgets/order/order_list_widget.dart';

class LoadedOrderView extends StatelessWidget {
  final int id;

  const LoadedOrderView({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Order $id'),),
      body: FutureBuilder<Order>(
        future: fetchOrder(id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Order? order = snapshot.data;
            return ListView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: const EdgeInsets.all(10),
              children: [
                OrderListWidget(
                  products: order?.products ?? [],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Text(order?.date?? ''),
                    Expanded(
                      child: Text(
                        'Total: ${(order?.price?? 0).toStringAsFixed(2)} \$',
                        style: const TextStyle(fontSize: 24),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
                // Create Widget
              ],
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          // By default, show a loading spinner.
          return const Center(child: CircularProgressIndicator());
        },
      )
    );
  }
}

