import 'supplier.dart';

class Product {
  final int id;
  final String name;
  final int menuId;
  final double price;
  final String image;
  final String type;
  final List<String> ingredients;
  int? counter = 0;

  Product(
      {required this.id,
      required this.name,
      required this.menuId,
      required this.price,
      required this.image,
      required this.type,
      required this.ingredients,
      required this.counter,
      });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'] as int,
        name: json['name'] as String,
        menuId: json['menuId'] as int,
        price: json['price'] as double,
        image: json['image'] as String,
        type: json['type'] as String,
        ingredients: (json['ingredients'] as List<dynamic>).map((dynamic e) => e.toString()).toList(),
        counter: json['counter'] as int?,
    );
  }
}

class ProductsResponse {
  final List<Product> products;
  final List<String> types;

  ProductsResponse({required this.products, required this.types});

  factory ProductsResponse.fromJson(Map<String, dynamic> json) {
    return ProductsResponse(
        products: (json['Products'] as List<dynamic>)
            .map((dynamic e) => Product.fromJson(e))
            .toList(),
        types: (json['Types'] as List<dynamic>).map((dynamic e) => e.toString()).toList()
    );
  }
}

class ProductInfo {
  final Product? product;
  final Supplier? supplier;

  ProductInfo({required this.product, required this.supplier});

  factory ProductInfo.fromJson(Map<String, dynamic> json) {
    return ProductInfo(
        product: json['Product'] != null
            ? Product.fromJson(json['Product']) : null,
        supplier: json['Supplier'] != null
          ? Supplier.fromJson(json['Supplier']) : null
    );
  }
}
