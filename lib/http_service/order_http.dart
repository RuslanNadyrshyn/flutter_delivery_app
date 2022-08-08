import 'dart:convert';

import 'package:food_delivery/http_service/constants.dart';
import 'package:food_delivery/models/order.dart';
import 'package:http/http.dart';

Future<List<OrderResponse>> fetchOrders(String accessToken) async {
  List<OrderResponse> ordersResp = [];

  final uri = Uri(
    scheme: scheme,
    host: host,
    port: port,
    path: orders,
  );
  print(uri);

  Map<String, String> headers = {
    'Authorization': 'Bearer $accessToken',
  };

  try {
    Response res = await get(uri, headers: headers);
    print('orders status: ${res.statusCode}');
    if (res.statusCode == 200) {
      final result = jsonDecode(res.body);
      ordersResp = ((result?? []) as List<dynamic>)
          .map((dynamic e) => OrderResponse.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      throw "Can't get user orders!";
    }
  } catch (e) {
    print(e);
  }

  return ordersResp;
}

Future<Order> fetchOrder(int id) async {
  Order orderResp =
      Order(id: 0, userId: 0, address: '', price: 0, products: [], date: '');

  final uri = Uri(
      scheme: scheme,
      host: host,
      port: port,
      path: getOrder,
      queryParameters: {'id': '$id'});
  print(uri);

  try {
    Response res = await get(uri);

    if (res.statusCode == 200) {
      final result = jsonDecode(res.body);
      orderResp = Order.fromJson(result);
    } else {
      throw "Can't get order!";
    }
  } catch (e) {
    print(e);
  }

  return orderResp;
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

Future<int> postOrderRequest(OrderRequest orderRequest) async {
  int result = 0;

  Map<String, dynamic> body = orderRequest.toJson();

  final uri = Uri(
    scheme: scheme,
    host: host,
    port: port,
    path: postOrder,
  );
  print(uri);

  try {
    Response res = await post(uri, body: jsonEncode(body));
    if (res.statusCode == 200) {
      result = jsonDecode(res.body);
    } else {
      throw "Can't post order up!";
    }
  } catch (e) {
    print(e);
  }

  return result;
}
