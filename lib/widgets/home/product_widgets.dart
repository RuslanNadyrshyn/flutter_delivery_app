import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/models/provider.dart';
import 'package:provider/provider.dart';

import '../../http_service.dart';
import '../../models/product.dart';
import 'types_widget.dart';


class ProductsListWidget extends StatefulWidget {
  const ProductsListWidget({Key? key}) : super(key: key);

  @override
  State<ProductsListWidget> createState() => _ProductsListWidgetState();
}

class _ProductsListWidgetState extends State<ProductsListWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 14,
      child: Container(
        decoration: listBoxDecoration(context),
        child: FutureBuilder<ProductsResponse>(
          future: getProductsResponse(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              ProductsResponse? data = snapshot.data;
              return Column(
                children: [
                  TypesWidget(
                    key: Key('product'),
                    types: ["All"] + data!.types,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: data.products.length,
                      itemExtent: 136,
                      itemBuilder: (BuildContext context, int index) {
                        return ProductCardWidget(product: data.products[index]);
                      },
                    ),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return Center(
              child: const CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}



class ProductCardWidget extends StatefulWidget {

  final Product product;

  const ProductCardWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductCardWidget> createState() => _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<ProductCardWidget> {
  late bool isInBasket;

  void checkIsInBasket () {
    isInBasket = Provider.of<LocaleProvider>(context, listen: false)
        .basket.any((element) => element.id == widget.product.id);
    setState(() {});
  }

  void _addToBasket() {
    checkIsInBasket();
    if (isInBasket) { return;}
    else {
      widget.product.counter = 1;
      print(widget.product.counter);
      Provider.of<LocaleProvider>(context, listen: false).addToBasket(widget.product);
      print('Added to basket');
      setState(() {
        isInBasket = true;
      });
    }
  }

  void _goToProductView() {
    print('Go to product ${widget.product.name} with id: ${widget.product.id}');
    Navigator.pushNamed(context, '/product', arguments: widget.product);
  }

  String getIngredientsString() {
    return widget.product.ingredients.reduce((value, element) => '$value, $element');
  }

  @override
  void initState() {
    checkIsInBasket();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Stack(
        children: [
          Container(
            decoration: cardBoxDecoration(context),
            padding: const EdgeInsets.all(5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 130,
                  child: FadeInImage.assetNetwork(
                    image: widget.product.image,
                    placeholder: 'assets/place_holder.png',
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 36,
                        child: Text(
                          widget.product.name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            height: 0.9,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 40,
                        child: Text(
                          getIngredientsString(),
                          style: TextStyle(fontSize: 14, height: 0.9),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(height: 6),
                      Row(
                        children: [
                          SizedBox(width: 5),
                          Text(
                            '${widget.product.price.toStringAsFixed(2)} \$',
                            style: TextStyle(fontSize: 22),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              widget.product.type,
                              textAlign: TextAlign.end,
                              style: TextStyle(fontSize: 12),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(width: 60),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: _goToProductView,
            ),
          ),
          Positioned(
            height: 30,
            width: 50,
            right: 10,
            bottom: 10,
            child: ElevatedButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 0)),
                  textStyle: MaterialStateProperty.all<TextStyle>(
                      TextStyle(fontSize: 14))),
              onPressed: isInBasket ? null : _addToBasket,
              child:  Icon(Icons.shopping_basket),
            ),
          ),
        ],
      ),
    );
  }
}
