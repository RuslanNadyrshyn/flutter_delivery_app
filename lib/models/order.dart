import 'package:food_delivery/models/product.dart';
import 'package:food_delivery/models/user.dart';

class CurrentOrder {
  User user;
  double totalPrice;
  String address;
  List<Product> products;

  CurrentOrder({
    required this.user,
    required this.totalPrice,
    required this.address,
    required this.products,
  });
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

/*
type OrderRequest struct {
	User       *models.User `json:"user"`
	TotalPrice float64      `json:"totalPrice"`
	Address    string       `json:"address"`
	Products   []struct {
		ProductId    int64   `json:"id"`
		ProductPrice float64 `json:"price"`
		Counter      int64   `json:"counter"`
	} `json:"products"`
}
 */