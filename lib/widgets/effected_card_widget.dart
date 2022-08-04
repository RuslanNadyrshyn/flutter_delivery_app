import 'package:flutter/material.dart';
import 'package:food_delivery/models/product.dart';

class EffectedCardWidget extends StatelessWidget {
  final EdgeInsets padding;
  final Widget widget;
  final Function() action;
  final List<Widget>? positioned;

  const EffectedCardWidget(
      {Key? key,
        required this.padding,
        required this.widget,
        required this.action,
        this.positioned})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Stack(
        children: [
          widget,
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: action,
            ),
          ),
          if (positioned != null) ...positioned!,
        ],
      ),
    );
  }
}

void goToProductView(BuildContext context, Product product) {
  Navigator.pushNamed(context, '/product', arguments: product);
}