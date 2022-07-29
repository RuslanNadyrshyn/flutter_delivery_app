import 'product.dart';

class User {
  final int id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
    );
  }
}

class Order {
  final int id;
  final List<Product> products;
  final String address;
  final int userId;
  final String date;

  Order(
      {required this.id,
      required this.products,
      required this.address,
      required this.userId,
      required this.date});

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'] as int,
      products: json['products'] as List<Product>,
      address: json['address'] as String,
      userId: json['userId'] as int,
      date: json['date'] as String,
    );
  }
}
