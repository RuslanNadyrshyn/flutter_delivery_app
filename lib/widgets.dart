import 'package:flutter/material.dart';

import 'generated/l10n.dart';
import 'models.dart';

class TypesWidget extends StatelessWidget {
  final List<String> types;
  const TypesWidget({Key? key, required this.types}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Theme.of(context).appBarTheme.backgroundColor,
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: 30,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: (types
            .map((type) => Container(
            padding: EdgeInsets.all(2),
            child: ElevatedButton(onPressed: () {}, child: Text(type))))
            .toList()),
      ),
    );
  }
}

class SuppliersListWidget extends StatelessWidget {
  final List<Supplier> suppliers;

  const SuppliersListWidget({Key? key, required this.suppliers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: 190,
      color: Theme.of(context).appBarTheme.backgroundColor,
      width: double.infinity,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: (suppliers
            .map((supplier) => SupplierCardWidget(supplier: supplier))
            .toList()),
      ),
    );
  }
}

class SupplierCardWidget extends StatelessWidget {
  // final Image img;
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
          const Expanded(
            child: Placeholder(), // img
          ),
          const SizedBox(height: 10),
          Text(
            supplier.name,
            style: TextStyle(fontSize: 20),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),
          Text('${supplier.opening} - ${supplier.closing}'),
        ],
      ),
    );
  }
}

class ProductsListWidget extends StatelessWidget {
  final List<Product> products;

  const ProductsListWidget({Key? key, required this.products})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        color: Theme.of(context).appBarTheme.backgroundColor,
        child: GridView.count(
          padding: const EdgeInsets.all(10),
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          scrollDirection: Axis.vertical,
          children: (products
              .map((product) => ProductCardWidget(
            product: product,
          ))
              .toList()),
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
    return Container(
      padding: const EdgeInsets.all(10),
      color: Theme.of(context).cardTheme.color,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Expanded(
              child: Placeholder(), // img
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
