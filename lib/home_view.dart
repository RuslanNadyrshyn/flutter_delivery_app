import 'package:flutter/material.dart';

class Supplier {
  final String name;
  final String workingHours;

  Supplier(this.name, this.workingHours);
}

class Product {
  final String name;
  final double price;
  // final Image image;
  final String image;

  Product(this.name, this.price, this.image);
}


class HomeView extends StatelessWidget {

  final List<String> suppliersTypes = [
    'Pizzeria',
    'Caffe'
    'Fast food',
  ];

  final List<Supplier> suppliers = [
    Supplier('Burger Club', '11:00-21:00'),
    Supplier('Pizza Club', '10:00-23:00'),
    Supplier('Sushi', '10:00-23:00'),
  ];

  final List<String> productTypes = [
    'Pizza',
    'Burger',
    'Sushi',
  ];
  final List<Product> products = [
    Product('pizza1', 2.4, 'img'),
    Product('pizza2', 2.4, 'img'),
    Product('pizza3', 2.4, 'img'),
    Product('burger1', 2.4, 'img'),
    Product('burger3', 2.4, 'img'),
    Product('burger4', 2.4, 'img'),
    Product('sushi1', 2.4, 'img'),
    Product('sushi2', 2.4, 'img'),
    Product('sushi3', 2.4, 'img'),
  ];

  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delivery'),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 20),
          _SuppliersListWidget(suppliers: suppliers),
          const SizedBox(height: 20),
          _ProductsListWidget(products: products),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class _SuppliersListWidget extends StatelessWidget {
  final List<Supplier> suppliers;

  const _SuppliersListWidget({Key? key, required this.suppliers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      color: Colors.amberAccent,
      width: double.infinity,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children:(
            suppliers.map((supplier) => _SupplierWidget(supplier: supplier)).toList()
        ),
      ),
    );
  }
}

class _SupplierWidget extends StatelessWidget {
  // final Image img;
  final Supplier supplier;

  const _SupplierWidget({
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
      color: Colors.deepOrangeAccent,
      child: Column(
        children: [
          const SizedBox(
            width: 100,
            height: 100,
            child: Placeholder(), // img
          ),
          const SizedBox(height: 10),
          Text(supplier.name),
          const SizedBox(height: 10),
          Text(supplier.workingHours),
        ],
      ),
    );
  }
}

class _ProductWidget extends StatelessWidget {
  final Product product;

  const _ProductWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      color: Colors.deepOrangeAccent,
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              width: 100,
              height: 100,
              child: Placeholder(), // img
            ),
            const SizedBox(height: 5),
            Text(product.name),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('${product.price}'),
                ElevatedButton(
                  onPressed: (){},
                  child: const Text('Add'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _ProductsListWidget extends StatelessWidget {
  final List<Product> products;

  const _ProductsListWidget({Key? key, required this.products})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      color: Colors.amberAccent,
      child: GridView.count(
        padding: const EdgeInsets.all(5),
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        crossAxisCount: 2,
        scrollDirection: Axis.vertical,
        children:(
            products.map((product) => _ProductWidget(product: product,)).toList()
        ),
      ),
    );
  }
}