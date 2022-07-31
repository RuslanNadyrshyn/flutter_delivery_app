import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';
import 'package:provider/provider.dart';

import '../generated/l10n.dart';
import '../http_service.dart';
import '../models/product.dart';
import '../models/supplier.dart';

class HomeView extends StatelessWidget {
  static const String title = '';
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SuppliersListWidget(),
        SizedBox(height: 20),
        ProductsListWidget(),
      ],
    );
  }
}

class TypesWidget extends StatelessWidget {
  final List<String> types;
  const TypesWidget({Key? key, required this.types}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String selectedSupplierType =
        Provider.of<LocaleProvider>(context).selectedSupplierType;
    String selectedProductType =
        Provider.of<LocaleProvider>(context).selectedProductType;

    MaterialStateProperty<Color> selectedColor =
        MaterialStateProperty.all<Color>(Colors.orangeAccent);

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: (types
            .map(
              (type) => Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
                child: ElevatedButton(
                  onPressed: () {
                    if (key == Key('supplier')) {
                      print('getting suppliers by type $type');
                      Provider.of<LocaleProvider>(context, listen: false)
                          .setSupplierType(type);
                      // Provider.of<LocaleProvider>(context, listen: false).setProductType('All');
                      getSuppliersByType(type);
                      // getProductsByParams(context, Params(0, "restaurant", "burger"));
                    } else if (key == Key('product')) {
                      print('getting product by type $type');
                      Provider.of<LocaleProvider>(context, listen: false)
                          .setProductType(type);
                      // getProductsByParams(context, Params(0, "restaurant", "burger"));
                    }
                  },
                  style: selectedSupplierType == type &&
                              key == Key('supplier') ||
                          selectedProductType == type && key == Key('product')
                      ? ButtonStyle(backgroundColor: selectedColor)
                      : ButtonStyle(),
                  child: Text(type),
                ),
              ),
            )
            .toList()),
      ),
    );
  }
}

class SuppliersListWidget extends StatefulWidget {
  const SuppliersListWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<SuppliersListWidget> createState() => _SuppliersListWidgetState();
}

class _SuppliersListWidgetState extends State<SuppliersListWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SuppliersResponse>(
      future: getSuppliersResponse(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          SuppliersResponse? data = snapshot.data;
          return Container(
            decoration: listBoxDecoration(context),
            child: Column(
              children: [
                TypesWidget(
                    key: Key('supplier'), types: ["All", "Open"] + data!.types),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  height: 190,
                  width: double.infinity,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: (data.suppliers
                        .map((supplier) =>
                            SupplierCardWidget(supplier: supplier))
                        .toList()),
                  ),
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        // By default, show a loading spinner.
        return Center(child: const CircularProgressIndicator());
      },
    );
  }
}

class SupplierCardWidget extends StatelessWidget {
  final Supplier supplier;

  const SupplierCardWidget({
    Key? key,
    required this.supplier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: cardBoxDecoration(context),
      margin: const EdgeInsets.all(5),
      width: 130,
      height: 170,
      padding: const EdgeInsets.all(10),
      // color: Theme.of(context).cardTheme.color,
      child: Column(
        children: [
          Center(
            child: Image.network(
              supplier.image,
              height: 100,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            supplier.name,
            style: TextStyle(fontSize: 20),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),
          Text(
              '${supplier.workingHours!.opening} - ${supplier.workingHours!.closing}'),
        ],
      ),
    );
  }
}

class ProductsListWidget extends StatefulWidget {
  const ProductsListWidget({Key? key}) : super(key: key);

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
            return Expanded(
              child: Container(
                decoration: listBoxDecoration(context),
                // color: Theme.of(context).backgroundColor,
                child: Column(
                  children: [
                    TypesWidget(
                        key: Key('product'), types: ["All"] + data!.types),
                    Expanded(
                      child: ListView.builder(
                        itemCount: data.products.length,
                        itemExtent: 136,
                        itemBuilder: (BuildContext context, int index) {
                          return ProductCardWidget(
                              product: data.products[index]);
                        },
                      ),
                    ),
                  ],
                ),
              ),
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
    // return Padding(
    //   padding: const EdgeInsets.symmetric(vertical: 8.0),
    //   child: Stack(children: [
    //     Container(
    //       padding: const EdgeInsets.all(10),
    //       color: Theme.of(context).cardTheme.color,
    //       child: Column(
    //         children: [
    //           Text(
    //             product.name,
    //             style: TextStyle(fontSize: 20),
    //             maxLines: 1,
    //             overflow: TextOverflow.ellipsis,
    //           ),
    //           const SizedBox(height: 5),
    //           Row(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Column(
    //                 children: [
    //                   Image.network(
    //                     product.image,
    //                     height: 100,
    //                     width: 130,
    //                   ),
    //                   const SizedBox(height: 5),
    //                   Text(
    //                     '${product.price} \$',
    //                     style: TextStyle(fontSize: 25),
    //                   ),
    //                 ],
    //               ),
    //               const SizedBox(width: 15),
    //               Expanded(
    //                 child: Column(
    //                   mainAxisAlignment: MainAxisAlignment.start,
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     Text(
    //                       product.type,
    //                       style: TextStyle(fontSize: 15),
    //                       overflow: TextOverflow.ellipsis,
    //                     ),
    //                     const SizedBox(height: 5),
    //                     Text(
    //                       ingredients,
    //                       style: TextStyle(fontSize: 16),
    //                       maxLines: 3,
    //                       overflow: TextOverflow.ellipsis,
    //                     )
    //                   ],
    //                 ),
    //               )
    //             ],
    //           ),
    //         ],
    //       ),
    //     ),
    //     Material(
    //       color: Colors.transparent,
    //       child: InkWell(
    //         onTap: _goToProductView,
    //       ),
    //     ),
    //     Positioned(
    //       right: 15,
    //       bottom: 10,
    //       child: ElevatedButton(
    //         style: Theme.of(context).elevatedButtonTheme.style,
    //         onPressed: () {
    //           // AddToBasket();
    //         },
    //         child: Text(S.of(context).add_btn),
    //       ),
    //     )
    //   ]),
    // );
  }
}
