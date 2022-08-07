import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/models/product.dart';
import 'package:food_delivery/my_provider/basket_provider.dart';
import 'package:food_delivery/widgets/counter_widget.dart';
import 'package:food_delivery/widgets/effected_card_widget.dart';
import 'package:food_delivery/widgets/image_widget.dart';
import 'package:food_delivery/widgets/price_text_widget.dart';
import 'package:food_delivery/widgets/product_title_widget.dart';
import 'package:provider/provider.dart';

class BasketCardWidget extends StatefulWidget {
  final Product product;
  final int index;

  const BasketCardWidget({
    Key? key,
    required this.product,
    required this.index,
  }) : super(key: key);

  @override
  State<BasketCardWidget> createState() => _BasketCardWidgetState();
}

class _BasketCardWidgetState extends State<BasketCardWidget> {
  int getCounter() {
    return Provider.of<BasketProvider>(context, listen: false)
        .basket[widget.index]
        .counter!;
  }

  void _removeProduct() {
    Provider.of<BasketProvider>(context, listen: false)
        .removeFromBasket(widget.product.id);
  }

  void inc() {
    int counter = getCounter();
    Provider.of<BasketProvider>(context, listen: false)
        .changeCounter(widget.index, ++counter);
  }

  void dec() {
    int counter = getCounter();
    if (counter > 1) {
      Provider.of<BasketProvider>(context, listen: false)
          .changeCounter(widget.index, --counter);
    }
  }

  @override
  Widget build(BuildContext context) {
    final counter = getCounter();
    return EffectedCardWidget(
      action: () => goToProductView(context, widget.product.id),
      padding: const EdgeInsets.all(5.0),
      widget: _BasketCardRowWidget(
        product: widget.product,
        index: widget.index,
      ),
      positioned: [
          Positioned(
            top: 1,
            right: 1,
            child: Material(
              child: _RemoveFromBasketWidget(
                  icon: const Icon(Icons.close), size: 30, func: _removeProduct),
            ),
          ),
          Positioned(
            left: 125,
            bottom: 5,
            child: Material(
              child: _counterRowWidget(inc, dec, counter),
            ),
          ),
        ],
    );
  }
}

class _BasketCardRowWidget extends StatefulWidget {
  final Product product;
  final int index;

  const _BasketCardRowWidget(
      {Key? key, required this.product, required this.index})
      : super(key: key);

  @override
  State<_BasketCardRowWidget> createState() => _BasketCardRowWidgetState();
}

class _BasketCardRowWidgetState extends State<_BasketCardRowWidget> {
  @override
  Widget build(BuildContext context) {
    int counter = Provider.of<BasketProvider>(context, listen: false)
        .basket[widget.index].counter!;
    return DecoratedBox(
      decoration: cardBoxDecoration(context),
      child: Padding(
        padding: const EdgeInsets.all(7),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FadeInImageWidget(
              image: widget.product.image,
              height: 100,
              width: 100,
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: ProductTitleWidget(
                          name: widget.product.name,
                          fontSize: 22,
                          height: 1,
                        ),
                      ),
                      const SizedBox(width: 30),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 100),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            PriceTextWidget(
                              price: widget.product.price,
                              fontSize: 16,
                              textAlign: TextAlign.end,
                            ),
                            PriceTextWidget(
                              price: widget.product.price * counter,
                              fontSize: 24,
                              textAlign: TextAlign.end,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RemoveFromBasketWidget extends StatelessWidget {
  final Icon icon;
  final double size;
  final Function() func;

  const _RemoveFromBasketWidget(
      {Key? key, required this.icon, required this.size, required this.func})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: size,
      padding: const EdgeInsets.all(0),
      constraints: BoxConstraints(maxWidth: size, maxHeight: size),
      splashRadius: 15,
      onPressed: func,
      icon: icon,
    );
  }
}

Widget _counterRowWidget(
    void Function() inc, void Function() dec, int counter) {
  return Row(
    children: [
      _counterButtonWidget(Colors.red, const Icon(Icons.remove), dec),
      CounterWidget(
        counter: counter,
        fontSize: 20,
      ),
      // Text('$counter', style: TextStyle(fontSize: 30)),
      _counterButtonWidget(Colors.green, const Icon(Icons.add), inc),
    ],
  );
}

Widget _counterButtonWidget(Color color, Icon icon, void Function() func) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: color,
      ),
      child: IconButton(
        splashRadius: 25,
        constraints: const BoxConstraints.tightFor(height: 35, width: 35),
        padding: EdgeInsets.zero,
        onPressed: func,
        icon: icon,
      ),
    ),
  );
}
