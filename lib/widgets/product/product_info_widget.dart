import 'package:flutter/material.dart';
import 'package:food_delivery/models/product.dart';
import 'package:food_delivery/widgets/price_text_widget.dart';
import 'package:food_delivery/widgets/to_basket_button_widget.dart';

class ProductInfoWidget extends StatelessWidget {
  final Product product;

  const ProductInfoWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FadeInImage.assetNetwork(
          image: product.image,
          placeholder: 'assets/place_holder.png',
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            product.name,
            style: TextStyle(fontSize: 30),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Row(
            children: [
              Expanded(
                child: PriceTextWidget(
                  price: product.price,
                  fontSize: 30,
                  textAlign: TextAlign.start,
                ),
              ),
              ToBasketButtonWidget(
                product: product,
                iconSize: 40,
                padding: EdgeInsets.symmetric(horizontal: 0),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          color: Theme.of(context).backgroundColor,
          padding: EdgeInsets.all(10),
          width: double.infinity,
          child: Column(
            children: product.ingredients
                .map((e) => Text(e, style: TextStyle(fontSize: 25)))
                .toList(),
          ),
        ),
      ],
    );
  }
}
