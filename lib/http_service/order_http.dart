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
      ordersResp = (result as List<dynamic>)
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
