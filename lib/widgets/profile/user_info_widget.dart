import 'package:flutter/material.dart';
import 'package:food_delivery/models/user.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User user = User(id: 1, name: 'Ruslan', email: 'email');
    return Container(
      padding: const EdgeInsets.all(15),
      width: double.infinity,
      color: Theme.of(context).backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Id: ${user.id}',
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 5),
          Text(
            'Name: ${user.name}',
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 5),
          Text(
            'Email: ${user.email}',
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}