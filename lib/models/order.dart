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
/*
	resp := &responses.OrderResponse{
		Id:        order.Id,
		UserId:    order.UserId,
		Address:   order.Address,
		Price:     order.Price,
		Products:  respProducts,
		CreatedAt: order.CreatedAt,
	}
 */
class Order {
  final int id;
  final int userId;
  final String address;
  final double price;
  final List<Product> products;
  final String date;

  Order({
    required this.id,
      required this.userId,
      required this.address,
      required this.price,
      required this.products,
      required this.date});

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'] as int,
      userId: json['userId'] as int,
      address: json['address'] as String,
      price: json['price'] as double,
      products: json['products'] as List<Product>,
      date: json['date'] as String,
    );
  }
}

class OrderResponse {
  final int id;
  final int userId;
  final String address;
  final double price;
  final List<Product> products;
  final String date;

  const OrderResponse({
    required this.id,
    required this.userId,
    required this.address,
    required this.price,
    required this.products,
    required this.date,
  });
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