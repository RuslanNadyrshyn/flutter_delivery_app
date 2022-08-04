import 'package:flutter/material.dart';
import 'package:food_delivery/models/provider.dart';
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
            children: [
              TypesWidget(
                  types: [''] + Provider.of<LocaleProvider>(context).prodTypes,
                  parent: 'product',
              ),
              Expanded(
                child: Scrollbar(
                  thumbVisibility: true,
                  child: ListView.builder(
                    itemCount: Provider.of<LocaleProvider>(context).products.length,
                    itemExtent: 135,
                    itemBuilder: (BuildContext context, int index) {
                      return ProductCardWidget(product: Provider.of<LocaleProvider>(context).products[index]);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );



    //   Expanded(
    //   child: ColoredBox(
    //     color: Theme.of(context).backgroundColor,
    //     child: FutureBuilder<ProductsResponse>(
    //       future: getProductsResponse(),
    //       builder: (context, snapshot) {
    //         if (snapshot.hasData) {
    //           ProductsResponse? data = snapshot.data;
    //           return Column(
    //             children: [
    //               TypesWidget(
    //                 types: ["All"] + data!.types,
    //                 parent: 'product',
    //               ),
    //               Expanded(
    //                 child: Scrollbar(
    //                   thumbVisibility: true,
    //                   child: ListView.builder(
    //                     itemCount: data.products.length,
    //                     itemExtent: 136,
    //                     itemBuilder: (BuildContext context, int index) {
    //                       return ProductCardWidget(product: data.products[index]);
    //                     },
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           );
    //         } else if (snapshot.hasError) {
    //           return Text('${snapshot.error}');
    //         }
    //         return Center(
    //           child: const CircularProgressIndicator(),
    //         );
    //       },
    //     ),
    //   ),
    // );
  }
}
