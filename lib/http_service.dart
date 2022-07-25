import 'dart:convert';
import 'package:food_delivery/models/product.dart';
import 'package:http/http.dart';

import 'models/supplier.dart';

const host = 'http://45.148.29.14:8080';

const String getAllSuppliersUrl = '$host/get_suppliers';
const String getAllProductsUrl = '$host/get_products';

Future<SuppliersResponse> getSuppliersResponse() async {
  Response res = await get(Uri.parse(getAllSuppliersUrl));
  SuppliersResponse resp = SuppliersResponse(suppliers: [], types: []);

  if (res.statusCode == 200) {
    try {
      final result = jsonDecode(res.body);
      resp = SuppliersResponse.fromJson(result);
    } catch (e) {
      print(e);
    }
    return resp;
  } else {
    throw "Can't get suppliers response!";
  }
}

Future<ProductsResponse> getProductsResponse() async {
  Response res = await get(Uri.parse(getAllProductsUrl));
  ProductsResponse resp = ProductsResponse(products: [], types: []);
  if (res.statusCode == 200) {
    try {
      final result = jsonDecode(res.body);
      resp = ProductsResponse.fromJson(result);
    } catch (e) {
      print(e);
    }
    return resp;
  } else {
    throw "Can't get products response!";
  }
}
