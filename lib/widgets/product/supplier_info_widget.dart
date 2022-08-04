import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/models/product.dart';
import 'package:food_delivery/widgets/effected_card_widget.dart';
import 'package:food_delivery/widgets/image_widget.dart';
import 'package:food_delivery/widgets/price_text_widget.dart';
import 'package:food_delivery/widgets/product_title_widget.dart';

class SupplierInfoWidget extends StatelessWidget {
  final Product product;
  // final Supplier supplier;
  const SupplierInfoWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              FadeInImage.assetNetwork(
                width: 200,
                image: product.image,
                placeholder: 'assets/place_holder.png',
              ),
              const SizedBox(height: 10),
              Text('Pizza Club', style: TextStyle(fontSize: 24)),
            ],
          ),
        ),
        Container(
          color: Theme.of(context).backgroundColor,
          height: 160,
          child: ListView(
              itemExtent: 130,
              scrollDirection: Axis.horizontal,
              children: [
                _ProductCardWidget(product: product),
                _ProductCardWidget(product: product),
                _ProductCardWidget(product: product),
                _ProductCardWidget(product: product),
              ]),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

class _ProductCardWidget extends StatelessWidget {
  final Product product;

  const _ProductCardWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      EffectedCardWidget(
        padding: EdgeInsets.all(0),
        widget: Container(
          decoration: cardBoxDecoration(context),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          margin: EdgeInsets.all(5),
          child: Column(
            children: [
              FadeInImageWidget(
                height: 70,
                width: 120,
                image: product.image,
              ),
              SizedBox(height: 5),
              ProductTitleWidget(name: product.name, fontSize: 15),
              SizedBox(height: 5),
              SizedBox(
                width: double.infinity,
                child: PriceTextWidget(price: product.price, fontSize: 17, textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
        ),
        action: () => goToProductView(context, product),
      );
  }
}
