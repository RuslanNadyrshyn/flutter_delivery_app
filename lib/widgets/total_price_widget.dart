import 'package:flutter/material.dart';
import 'package:food_delivery/generated/l10n.dart';
import 'package:food_delivery/my_provider/basket_provider.dart';
import 'package:provider/provider.dart';

class TotalPriceWidget extends StatelessWidget {
  final TextAlign textAlign;

  const TotalPriceWidget({Key? key, required this.textAlign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '${S.of(context).total}: ${countTotal(Provider.of<BasketProvider>(context).basket).toStringAsFixed(2)} \$',
      style: const TextStyle(fontSize: 24),
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
    );
  }
}