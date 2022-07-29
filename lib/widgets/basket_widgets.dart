import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../generated/l10n.dart';
import '../models/product.dart';

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
      color: Theme.of(context).appBarTheme.backgroundColor,
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
    const imageHeight = 100;
    const imageWidth = 100;

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
              imageCacheHeight: imageHeight,
              imageCacheWidth: imageWidth,
              placeholder: 'assets/place_holder.png',
              placeholderCacheWidth: imageHeight,
              placeholderCacheHeight: imageWidth,
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


class BasketListProvider extends ChangeNotifier {
  List<Product> products = [];

  void setBasketList(List<Product> prod) {
    products = prod;
    notifyListeners();
  }
}