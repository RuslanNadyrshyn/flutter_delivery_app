
import 'package:flutter/material.dart';

import '../generated/l10n.dart';
import '../http_service.dart';
import '../models/product.dart';
import 'widgets.dart';

class ProductsListWidget extends StatefulWidget {
  const ProductsListWidget(
      {Key? key})
      : super(key: key);

  @override
  State<ProductsListWidget> createState() => _ProductsListWidgetState();
}

class _ProductsListWidgetState extends State<ProductsListWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ProductsResponse>(
        future: getProductsResponse(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            ProductsResponse? data = snapshot.data;

            return Column(
              children: [
                TypesWidget(types: ["All"] + data!.types),
                Container(
                  height: 400,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  color: Theme.of(context).appBarTheme.backgroundColor,
                  child: GridView.count(
                    padding: const EdgeInsets.all(10),
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    crossAxisCount: 2,
                    scrollDirection: Axis.vertical,
                    childAspectRatio: 0.65,
                    children: (data.products
                        .map((product) => ProductCardWidget(
                      product: product,
                    ))
                        .toList()),
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          // By default, show a loading spinner.
          return Center(child: const CircularProgressIndicator());
        });
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
    return Container(
      height: 200,
      padding: const EdgeInsets.all(10),
      color: Theme.of(context).cardTheme.color,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
                child: Image.network(
                  product.image,
                  height: 140,
                )
            ),
            const SizedBox(height: 5),
            Text(
              product.name,
              style: TextStyle(fontSize: 20),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${product.price} \$',
                  style: TextStyle(fontSize: 25),
                ),
                ElevatedButton(
                  style: Theme.of(context).elevatedButtonTheme.style,
                  onPressed: () {},
                  child: Text(S.of(context).add_btn),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
