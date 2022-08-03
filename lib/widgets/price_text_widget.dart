import 'package:flutter/material.dart';

class PriceTextWidget extends StatelessWidget {
  final double price;
  final double fontSize;
  final TextAlign textAlign;

  const PriceTextWidget({Key? key, required this.price, required this.fontSize, required this.textAlign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '${price.toStringAsFixed(2)} \$',
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
      style: TextStyle(fontSize: fontSize),
    );
  }
}