import 'package:flutter/material.dart';
import 'package:food_delivery/my_provider/auth_provider.dart';
import 'package:food_delivery/widgets/profile/order_list_widget.dart';
import 'package:food_delivery/widgets/profile/user_info_widget.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const UserInfoWidget(),
        if (Provider.of<AuthProvider>(context).userOrders.isNotEmpty) ...[
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Orders',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
            ),
          ),
          const Expanded(child: OrdersListWidget()),
        ] else
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('No orders yet', style: TextStyle(fontSize: 20),),
          ),
      ],
    );
  }
}
