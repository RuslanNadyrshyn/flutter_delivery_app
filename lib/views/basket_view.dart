import 'package:flutter/material.dart';
import 'package:food_delivery/models/product.dart';

import '../generated/l10n.dart';

class BasketView extends StatefulWidget {
  const BasketView({Key? key}) : super(key: key);

  @override
  State<BasketView> createState() => _BasketViewState();
}

class _BasketViewState extends State<BasketView> {
  List<Product> products = [
    Product(
        id: 1,
        name: "nameasdas asdasdasdasdasdasdas dasdasdasd",
        menuId: 2,
        price: 4.0,
        image: 'http://via.placeholder.com/150x150',
        type: 'type',
        ingredients: ['ingredients']),
    Product(
        id: 2,
        name: "nameasdas asdasdasdasdasdasdas dasdasdasd",
        menuId: 2,
        price: 322.0,
        image: 'http://via.placeholder.com/150x150',
        type: 'type',
        ingredients: ['ingredients']),
  ];
  double sum = 0.0;

  void _countSum() {
    setState(() {
      sum = 0;
      for (var element in products) {
        sum += element.price;
      }
    });
  }

  void _removeProduct(int id) {
    for (var prod in products) {
      if (prod.id == id) {
        setState(() {
          products.remove(prod);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _countSum();
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Expanded(child: BasketListWidget(products: products)),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${S.of(context).total}: $sum',
                  style: TextStyle(fontSize: 24),
                ),
                ElevatedButton(
                  style: ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.all(10))),
                  onPressed: () {},
                  child: Text(S.of(context).to_order, style: TextStyle(fontSize: 20),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class BasketListWidget extends StatefulWidget {
  final List<Product> products;
  const BasketListWidget({Key? key, required this.products}) : super(key: key);

  @override
  State<BasketListWidget> createState() => _BasketListWidgetState();
}

class _BasketListWidgetState extends State<BasketListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: ListView(
          children: (widget.products
              .map((product) => BasketCardWidget(product: product))
              .toList())),
    );
  }
}

class BasketCardWidget extends StatefulWidget {
  final Product product;

  const BasketCardWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<BasketCardWidget> createState() => _BasketCardWidgetState();
}

class _BasketCardWidgetState extends State<BasketCardWidget> {
  int counter = 1;

  void inc(){
    setState(() {
      counter++;
    });
  }
  void dec(){
    if (counter > 1) {
      setState(() {
        counter--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      color: Theme.of(context).cardTheme.color,
      child: Center(
        child: Row(
          children: [
            FadeInImage.assetNetwork(
              image: widget.product.image,
              imageCacheHeight: 100,
              imageCacheWidth: 100,
              placeholder: 'assets/place_holder.png',
              placeholderCacheWidth: 100,
              placeholderCacheHeight: 100,
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.product.name,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                        alignment: Alignment.topRight,
                        onPressed: () {
                        },
                        icon: Align(
                            alignment: Alignment.topRight,
                            child: Icon(Icons.close)),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.red,
                            ),
                            margin: EdgeInsets.all(10),
                            child: IconButton(
                              constraints: BoxConstraints.tightFor(height: 30, width: 30),
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                dec();
                              },
                              icon: Icon(Icons.remove),
                            ),
                          ),
                          Text(
                            '$counter',
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.green,
                            ),
                            margin: EdgeInsets.all(10),
                            child: IconButton(
                              constraints: BoxConstraints.tightFor(height: 30, width: 30),
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                inc();
                              },
                              icon: Icon(Icons.add),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Text(
                          '${widget.product.price*counter} \$',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.end,
                          style: TextStyle(fontSize: 30),
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

