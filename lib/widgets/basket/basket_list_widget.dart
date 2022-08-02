import 'package:flutter/material.dart';
import 'package:food_delivery/models/provider.dart';
import 'package:food_delivery/widgets/order/order_list_widget.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../models/product.dart';

class BasketListWidget extends StatelessWidget {
  const BasketListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: ListView.builder(
        itemCount: Provider.of<LocaleProvider>(context).basket.length,
        itemBuilder: (BuildContext context, int index) {
          final product = Provider.of<LocaleProvider>(context).basket[index];
          return BasketCardWidget(product: product, index: index);
        },
      ),
    );
  }
}

int getCounter (BuildContext context, int index) {
  return Provider.of<LocaleProvider>(context, listen: false).basket[index].counter!;
}

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
  void _removeProduct() {
    Provider.of<LocaleProvider>(context, listen: false)
        .removeFromBasket(widget.product.id);
  }

  void inc() {
    int counter = getCounter(context, widget.index);
    Provider.of<LocaleProvider>(context, listen: false)
        .changeCounter(widget.index, ++counter);
  }

  void dec() {
    int counter = getCounter(context, widget.index);
    if (counter > 1) {
      Provider.of<LocaleProvider>(context, listen: false)
          .changeCounter(widget.index, --counter);
    }
  }

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<LocaleProvider>(context, listen: false)
        .basket[widget.index]
        .counter!;
    return Container(
      decoration: cardBoxDecoration(context),
      height: 110,
      padding: const EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      // color: Theme.of(context).cardTheme.color,
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
                      onPressed: _removeProduct,
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
                            constraints:
                                BoxConstraints.tightFor(height: 30, width: 30),
                            padding: EdgeInsets.zero,
                            onPressed: dec,
                            icon: Icon(Icons.remove),
                          ),
                        ),
                        Text(
                          // '${Provider.of<LocaleProvider>(context, listen: false).basket[widget.index].counter!}',
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
                            constraints:
                                BoxConstraints.tightFor(height: 30, width: 30),
                            padding: EdgeInsets.zero,
                            onPressed: inc,
                            icon: Icon(Icons.add),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '${widget.product.price} \$',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.end,
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            '${(widget.product.price * counter).toStringAsFixed(2)} \$',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.end,
                            style: TextStyle(fontSize: 24),
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
    );
  }
}
