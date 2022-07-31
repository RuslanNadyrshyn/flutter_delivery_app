import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';

import '../../generated/l10n.dart';
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

class ProductCardWidget extends StatelessWidget {
  final Product product;

  const ProductCardWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String ingredients = product.ingredients.first;
    for (var i = 1; i < product.ingredients.length; i++) {
      ingredients += ', ${product.ingredients[i]}';
    }

    void _goToProductView() {
      print('Go to product ${product.name} with id: ${product.id}');
      Navigator.pushNamed(context, '/product', arguments: product);
    }

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
                    image: product.image,
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
                          product.name,
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
                          ingredients,
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
                            '${product.price} \$',
                            style: TextStyle(fontSize: 22),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              product.type,
                              textAlign: TextAlign.end,
                              style: TextStyle(fontSize: 12),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(width: 90),
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
            width: 80,
            right: 10,
            bottom: 10,
            child: ElevatedButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 0)),
                  textStyle: MaterialStateProperty.all<TextStyle>(
                      TextStyle(fontSize: 14))),
              onPressed: () {
                // AddToBasket();
              },
              child: Text(S.of(context).add_btn),
            ),
          ),
        ],
      ),
    );
  }
}
