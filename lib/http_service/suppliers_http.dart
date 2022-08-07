import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:food_delivery/http_service/constants.dart';
import 'package:http/http.dart';

import '../generated/l10n.dart';
import '../models/supplier.dart';

Future<SuppliersResponse> fetchSuppliers() async {
  SuppliersResponse resp = SuppliersResponse(suppliers: [], types: []);
  final uri = Uri(
      scheme: scheme,
      host: host,
      port: port,
      path: getSuppliers);
  try {
    Response res = await get(uri);

    if (res.statusCode == 200) {
      final result = jsonDecode(res.body);
      resp = SuppliersResponse.fromJson(result);
    } else {
      throw "Can't get suppliers response!";
    }
  } catch (e) {
    print(e);
  }
  return resp;
}

Future<List<Supplier>> fetchSuppliersByType(
    String type, BuildContext context) async {
  if (type == S.of(context).all) {
    type = '';
  } else if (type == S.of(context).open) {
    type = 'workingHours';
  }

  final uri = Uri(
      scheme: scheme,
      host: host,
      port: port,
      path: getSupByType,
      queryParameters: {'type': type}
  );
  print(uri.toString());

  List<Supplier> suppliers = [];
  try {
    Response res = await get(uri);
    // Response res = await get(Uri.parse(str));

    if (res.statusCode == 200) {
      final result = jsonDecode(res.body) as List<dynamic>;
      suppliers = result
          .map((dynamic e) => Supplier.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      throw "Can't get suppliers response!";
    }
  } catch (e) {
    print(e);
  }
  for (var element in suppliers) {
    print(element.name);
  }

  return suppliers;
}
