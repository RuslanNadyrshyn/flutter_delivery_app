import 'package:flutter/material.dart';
import 'package:food_delivery/models/order.dart';
import 'package:food_delivery/models/product.dart';
import 'package:food_delivery/models/user.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _UserInfoWidget(),
        SizedBox(height: 15),
        _OrdersListWidget(),
      ],
    );
  }
}

class _UserInfoWidget extends StatelessWidget {
  const _UserInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User user = User(id: 1, name: 'Ruslan', email: 'email');
    return Container(
        padding: EdgeInsets.all(15),
        width: double.infinity,
        color: Theme.of(context).backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Id: ${user.id}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 5),
            Text(
              'Name: ${user.name}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 5),
            Text(
              'Email: ${user.email}',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
    );
  }
}

class _OrdersListWidget extends StatelessWidget {
  const _OrdersListWidget({Key? key}) : super(key: key);

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
                ingredients: ['Cheese', 'Onion']),
          ],
          address: 'Kharkiv, prospect Nauki, 33',
          userId: 1,
          date: '12.02.2022, 22:43'),
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
                ingredients: ['Cheese', 'Onion']),
          ],
          address: 'Kharkiv, prospect Nauki, 33',
          userId: 1,
          date: '12.02.2022, 22:43'),
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
                ingredients: ['Cheese', 'Onion']),
          ],
          address: 'Kharkiv, prospect Nauki, 33',
          userId: 1,
          date: '12.02.2022, 22:43'),
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

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontSize: 16);
    return Container(
      color: Theme.of(context).cardColor,
      height: 50,
      padding: const EdgeInsets.all(8.0),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text('${order.id}', style: style,),
          SizedBox(width: 10),
          Expanded(child: Text(order.address, overflow: TextOverflow.ellipsis, style: style,)),
          SizedBox(width: 10),
          Text(order.date, style: style,),
        ],
      ),
    );
  }
}
