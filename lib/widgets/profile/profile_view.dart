import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/profile/order_list_widget.dart';
import 'package:food_delivery/widgets/profile/user_info_widget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        UserInfoWidget(),
        Expanded(child: OrdersListWidget()),
      ],
    );
  }
}


