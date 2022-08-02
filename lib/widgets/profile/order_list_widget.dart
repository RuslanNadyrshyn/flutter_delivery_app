


import 'package:flutter/material.dart';
import 'package:food_delivery/models/order.dart';
import 'package:food_delivery/models/product.dart';

class OrdersListWidget extends StatelessWidget {
  const OrdersListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Order> orders = [
      Order(
        id: 312,
        products: [
          Product(
            id: 1,
            name: 'pizza pepperoni',
            menuId: 2,
            image: 'image',
            price: 21.0,
            type: 'pizza',
            ingredients: ['Cheese', 'Onion'],
            counter: 3,
          ),
        ],
        address: 'Kharkiv, prospect Nauki, 33',
        userId: 1,
        date: '12.02.2022, 22:43',
        price: 42,
      ),
      Order(
          id: 312,
          products: [
            Product(
              id: 1,
              name: 'pizza pepperoni',
              menuId: 2,
              image: 'image',
              price: 21.0,
              type: 'pizza',
              ingredients: ['Cheese', 'Onion'],
              counter: 3,
            ),
          ],
          address: 'Kharkiv, prospect Nauki, 33',
          userId: 1,
          date: '12.02.2022, 22:43',
          price: 63),
      Order(
          id: 312,
          products: [
            Product(
              id: 1,
              name: 'pizza pepperoni',
              menuId: 2,
              image: 'image',
              price: 21.0,
              type: 'pizza',
              ingredients: ['Cheese', 'Onion'],
              counter: 3,
            ),
          ],
          address: 'Kharkiv, prospect Nauki, 33',
          userId: 1,
          date: '12.02.2022, 22:43',
          price: 21),
    ];

    return Expanded(
      child: ListView(
        children: orders.map((e) => _OrderRowWidget(order: e)).toList(),
      ),
    );
  }
}

class _OrderRowWidget extends StatelessWidget {
  final Order order;

  const _OrderRowWidget({Key? key, required this.order}) : super(key: key);

  _goToOrder(BuildContext context){
    Navigator.of(context).pushNamed('/loaded_order');
  }

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontSize: 16);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
      child: InkWell(
        onTap: () => _goToOrder(context),
        child: Ink(
          color: Theme.of(context).cardColor,
          height: 50,
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                '${order.id}',
                style: style,
              ),
              SizedBox(width: 10),
              Expanded(
                  child: Text(
                    order.address,
                    overflow: TextOverflow.ellipsis,
                    style: style,
                  )),
              SizedBox(width: 10),
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