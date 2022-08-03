

import 'package:flutter/material.dart';

class ProductTitleWidget extends StatelessWidget {
  final String name;
  final double fontSize;
  final double? height;

  const ProductTitleWidget(
      {Key? key,
        required this.name,
        required this.fontSize,
        this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      textAlign: TextAlign.center,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: fontSize,
        height: height ?? 1,
      ),
    );
  }
}
