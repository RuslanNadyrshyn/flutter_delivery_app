import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/models/product.dart';
import 'package:food_delivery/widgets/counter_widget.dart';
import 'package:food_delivery/widgets/image_widget.dart';
import 'package:food_delivery/widgets/price_text_widget.dart';
import 'package:food_delivery/widgets/product_title_widget.dart';

class OrderCardWidget extends StatelessWidget {
  final Product product;

  const OrderCardWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: cardBoxDecoration(context),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FadeInImageWidget(
            image: product.image,
            height: 50,
            width: 50,
          ),
          const SizedBox(width: 15),
          Expanded(
            flex: 4,
            child: ProductTitleWidget(
              name: product.name,
              fontSize: 20,
              height: 1,
            ),
          ),
          const SizedBox(width: 15),
          CounterWidget(counter: product.counter!, fontSize: 20),
          const SizedBox(width: 5),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (product.counter! > 1)
                  PriceTextWidget(price: product.price, fontSize: 18, textAlign: TextAlign.start,),
                PriceTextWidget(
                  price: product.price * product.counter!, fontSize: 22, textAlign: TextAlign.start,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}