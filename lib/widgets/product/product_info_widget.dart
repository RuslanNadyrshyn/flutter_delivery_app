import 'package:flutter/material.dart';
import 'package:food_delivery/models/provider.dart';
import 'package:food_delivery/widgets/price_text_widget.dart';
import 'package:food_delivery/widgets/to_basket_button_widget.dart';
import 'package:provider/provider.dart';

class ProductInfoWidget extends StatelessWidget {
  const ProductInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FadeInImage.assetNetwork(
          image: Provider.of<GlobalProvider>(context).productPageInfo!.product!.image,
          placeholder: 'assets/place_holder.png',
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            Provider.of<GlobalProvider>(context).productPageInfo!.product!.name,
            style: const TextStyle(fontSize: 30),
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
                  price: Provider.of<GlobalProvider>(context).productPageInfo!.product!.price,
                  fontSize: 30,
                  textAlign: TextAlign.start,
                ),
              ),
              ToBasketButtonWidget(
                product: Provider.of<GlobalProvider>(context).productPageInfo!.product!,
                iconSize: 40,
                padding: const EdgeInsets.symmetric(horizontal: 0),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          color: Theme.of(context).backgroundColor,
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          child: Column(
            children: Provider.of<GlobalProvider>(context).productPageInfo!.product!.ingredients
                .map((e) => Text(e, style: const TextStyle(fontSize: 25)))
                .toList(),
          ),
        ),
      ],
    );
  }
}
