import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/widgets/effected_card_widget.dart';
import 'package:food_delivery/widgets/image_widget.dart';

import 'package:food_delivery/widgets/product_title_widget.dart';
import 'package:food_delivery/widgets/to_basket_button_widget.dart';

import '../../models/product.dart';

class ProductCardWidget extends StatelessWidget {
  final Product product;

  const ProductCardWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EffectedCardWidget(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      widget: _ProductCardRowWidget(product: product),
      action: () => goToProductView(context, product.id),
      positioned: [
        Positioned(
          height: 30,
          width: 50,
          right: 10,
          bottom: 10,
          child: ToBasketButtonWidget(
            product: product,
            iconSize: 22,
            padding: const EdgeInsets.symmetric(horizontal: 0),
          ),
        ),
      ],
    );
  }
}

class _ProductCardRowWidget extends StatelessWidget {
  final Product product;

  const _ProductCardRowWidget({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: cardBoxDecoration(context),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FadeInImageWidget(
              image: product.image,
              height: 120,
              width: 130,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 36,
                    child: Align(
                      alignment: Alignment.center,
                      child: ProductTitleWidget(
                        name: product.name,
                        fontSize: 18,
                        height: 0.9,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        getIngredientsString(product.ingredients),
                        style: const TextStyle(fontSize: 14, height: 0.9),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const SizedBox(width: 10),
                      Text(
                        '${product.price.toStringAsFixed(2)} \$',
                        style: const TextStyle(fontSize: 22),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          product.type,
                          textAlign: TextAlign.end,
                          style: const TextStyle(fontSize: 12),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 60),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
