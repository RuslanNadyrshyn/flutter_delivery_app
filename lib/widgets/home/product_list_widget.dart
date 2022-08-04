import 'package:flutter/material.dart';
import 'package:food_delivery/http_service.dart';
import 'package:food_delivery/models/product.dart';
import 'package:food_delivery/widgets/home/product_card_widget.dart';
import 'types_widget.dart';

class ProductsListWidget extends StatelessWidget {
  const ProductsListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ColoredBox(
        color: Theme.of(context).backgroundColor,
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
                    child: Scrollbar(
                      thumbVisibility: true,
                      child: ListView.builder(
                        itemCount: data.products.length,
                        itemExtent: 136,
                        itemBuilder: (BuildContext context, int index) {
                          return ProductCardWidget(product: data.products[index]);
                        },
                      ),
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
