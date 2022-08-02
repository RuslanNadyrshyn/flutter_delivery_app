import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/models/product.dart';

class OrderListWidget extends StatelessWidget {
  final List<Product> products;

  const OrderListWidget({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      height: 350,
      child: ListView(
          itemExtent: 80,
          children: (products
              .map((product) => OrderCardWidget(product: product))
              .toList())),
    );
  }
}

class OrderCardWidget extends StatelessWidget {
  final Product product;

  const OrderCardWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: cardBoxDecoration(context),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FadeInImageWidget(
            image: product.image,
            height: 50,
            width: 50,
          ),
          const SizedBox(width: 15),
          _NameWidget(name: product.name),
          const SizedBox(width: 15),
          _CounterWidget(counter: product.counter!),
          const SizedBox(width: 5),
          _PriceWidget(price: product.price, counter: product.counter!),
        ],
      ),
    );
  }
}

class FadeInImageWidget extends StatelessWidget {
  final String image;
  final double height;
  final double width;

  const FadeInImageWidget(
      {Key? key,
      required this.image,
      required this.height,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInImage.assetNetwork(
      image: image,
      height: height,
      width: width,
      placeholder: 'assets/place_holder.png',
    );
  }
}

class _NameWidget extends StatelessWidget {
  final String name;

  const _NameWidget({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Text(
        name,
        style: TextStyle(fontSize: 20),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class _CounterWidget extends StatelessWidget {
  final int counter;

  const _CounterWidget({Key? key, required this.counter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      padding: EdgeInsets.all(5),
      // color: Theme.of(context).backgroundColor,
      child: Text(
        '$counter',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

class _PriceWidget extends StatelessWidget {
  final double price;
  final int counter;

  const _PriceWidget({Key? key, required this.price, required this.counter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (counter > 1)
            Text(
              '$price \$',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textAlign: TextAlign.end,
              style: TextStyle(fontSize: 20),
            ),
          Text(
            '${price * counter} \$',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            textAlign: TextAlign.end,
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
