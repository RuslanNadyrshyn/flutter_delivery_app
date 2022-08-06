import 'package:flutter/material.dart';
import 'package:food_delivery/models/product.dart';
import 'package:food_delivery/models/provider.dart';
import 'package:provider/provider.dart';

class ToBasketButtonWidget extends StatefulWidget {
  final Product product;
  final double iconSize;
  final EdgeInsets padding;

  const ToBasketButtonWidget(
      {Key? key,
        required this.product,
        required this.iconSize,
        required this.padding})
      : super(key: key);

  @override
  State<ToBasketButtonWidget> createState() => _ToBasketButtonWidgetState();
}

class _ToBasketButtonWidgetState extends State<ToBasketButtonWidget> {

  void _addToBasket() {
    if (!Provider.of<GlobalProvider>(context, listen: false)
        .basket.any((element) => element.id == widget.product.id)) {
      widget.product.counter = 1;
      Provider.of<GlobalProvider>(context, listen: false)
          .addToBasket(widget.product);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(widget.padding),
      ),
      onPressed: Provider.of<GlobalProvider>(context).basket.
      any((element) => element.id == widget.product.id) ? null : _addToBasket,
      child: Icon(Icons.shopping_basket, size: widget.iconSize),
    );
  }
}