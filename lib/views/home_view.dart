import 'package:flutter/material.dart';

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
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: (types
            .map((type) => Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
            child: ElevatedButton(
                onPressed: () {
                  if (key == Key('supplier')) {
                    print('getting suppliers by type $type');
                    getSuppliersByType(type);
                    // getProductsByParams(context, Params(0, "restaurant", "burger"));
                  } else if (key == Key('product')) {
                    print('getting product by type $type');
                    // getProductsByParams(context, Params(0, "restaurant", "burger"));
                  }
                },
                child: Text(type))))
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
            color: Theme.of(context).backgroundColor,
            child: Column(
              children: [
                TypesWidget(key: Key('supplier'), types: ["All", "Open"] + data!.types),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  height: 190,
                  width: double.infinity,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: (data.suppliers
                        .map((supplier) => SupplierCardWidget(supplier: supplier))
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
      margin: const EdgeInsets.all(5),
      width: 130,
      height: 170,
      padding: const EdgeInsets.all(10),
      color: Theme.of(context).cardTheme.color,
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
            return Expanded(
              child: Container(
                color: Theme.of(context).backgroundColor,
                child: Column(
                  children: [
                    TypesWidget(key: Key('product'), types: ["All"] + data!.types),
                    Expanded(
                      child: GridView.count(
                        padding: const EdgeInsets.all(10),
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        crossAxisCount: 2,
                        scrollDirection: Axis.vertical,
                        childAspectRatio: 0.6,
                        children: (data.products
                            .map((product) => ProductCardWidget(
                          product: product,
                        ))
                            .toList()),
                      ),
                    )
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
    return Container(
      height: 200,
      padding: const EdgeInsets.all(10),
      color: Theme.of(context).cardTheme.color,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                Text(product.type,style: TextStyle(fontSize: 15), overflow: TextOverflow.ellipsis,),
                Text(
                  '${product.price} \$',
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: Theme.of(context).elevatedButtonTheme.style,
                onPressed: () {
                  // AddToBasket();
                },
                child: Text(S.of(context).add_btn),
              ),
            )
          ],
        ),
      ),
    );
  }
}
