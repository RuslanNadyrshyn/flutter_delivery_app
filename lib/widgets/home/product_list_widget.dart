import 'package:flutter/material.dart';
import 'package:food_delivery/my_provider/home_view_provider.dart';
import 'package:food_delivery/widgets/home/product_card_widget.dart';
import 'package:provider/provider.dart';
import 'types_widget.dart';

class ProductsListWidget extends StatelessWidget {
  const ProductsListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ColoredBox(
        color: Theme.of(context).backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (Provider.of<HomeViewProvider>(context).productsLoading)
              const Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(color: Colors.cyanAccent))
            else ...[
              TypesWidget(
                types: [''] + Provider.of<HomeViewProvider>(context).prodTypes,
                parent: 'product',
              ),
              Expanded(
                child: Scrollbar(
                  thumbVisibility: true,
                  child: ListView.builder(
                    itemCount:
                        Provider.of<HomeViewProvider>(context).products.length,
                    itemExtent: 135,
                    itemBuilder: (BuildContext context, int index) {
                      return ProductCardWidget(
                          product: Provider.of<HomeViewProvider>(context)
                              .products[index]);
                    },
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
