import 'package:flutter/material.dart';
import 'package:food_delivery/models/order.dart';
import 'package:food_delivery/models/provider.dart';
import 'package:food_delivery/widgets/effected_card_widget.dart';
import 'package:provider/provider.dart';

class OrdersListWidget extends StatelessWidget {
  const OrdersListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<OrderResponse> orders =
        Provider.of<GlobalProvider>(context).userOrders;

    return ListView(
      children: [
        const _OrdersTitleWidget(),
        const Divider(
          thickness: 1,
          height: 3,
        ),
        ...orders.map((e) => _OrderItemWidget(order: e)).toList(),
      ],
    );
  }
}

class _OrdersTitleWidget extends StatelessWidget {
  const _OrdersTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: const [
          Text(
            'Id',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(width: 10),
          Expanded(
              child: Text(
            'Address',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 16),
          )),
          SizedBox(width: 10),
          SizedBox(
            width: 150,
            child: Text(
              'Date',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

class _OrderItemWidget extends StatelessWidget {
  final OrderResponse order;

  const _OrderItemWidget({Key? key, required this.order}) : super(key: key);

  _goToOrder(BuildContext context) {
    Navigator.of(context).pushNamed('/loaded_order', arguments: order.id);
  }

  @override
  Widget build(BuildContext context) {
    TextStyle style = const TextStyle(fontSize: 16);
    return SizedBox(
      height: 50,
      child: EffectedCardWidget(
        padding: const EdgeInsets.all(0),
        action: () => _goToOrder(context),
        widget: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                '${order.id}',
                style: style,
              ),
              const SizedBox(width: 10),
              Expanded(
                  child: Text(
                order.address,
                overflow: TextOverflow.ellipsis,
                style: style,
              )),
              const SizedBox(width: 10),
              Text(
                order.date,
                style: style,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
