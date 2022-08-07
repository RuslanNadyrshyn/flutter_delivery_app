import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:food_delivery/models/product.dart';
import 'package:food_delivery/http_service/constants.dart';
import 'package:http/http.dart';

import '../generated/l10n.dart';

Future<ProductsResponse> fetchProducts() async {
  ProductsResponse resp = ProductsResponse(products: [], types: []);
  final uri = Uri(
      scheme: scheme,
      host: host,
      port: port,
      path: getProducts);
  print(uri);
  try {
    Response res = await get(uri);

    if (res.statusCode == 200) {
      final result = jsonDecode(res.body);
      resp = ProductsResponse.fromJson(result);
    } else {
      throw "Can't get products response!";
    }
  } catch (e) {
    print(e);
  }
  return resp;
}

Future<ProductPageInfo> fetchProductPageInfo(
    BuildContext context, int id) async {
  ProductInfo productInfoResp = ProductInfo(product: null, supplier: null);
  ProductsResponse productResp = ProductsResponse(products: [], types: []);
  final getProdByIdUri = Uri(
      scheme: scheme,
      host: host,
      port: port,
      path: getProductById,
      queryParameters: {'id': '$id'}
  );


  try {
    Response res = await get(getProdByIdUri);
    if (res.statusCode == 200) {
      final result = jsonDecode(res.body);
      productInfoResp = ProductInfo.fromJson(result);
    } else {
      throw "Can't get products by id response!";
    }

    final getProdByParamsUri = Uri(
        scheme: scheme,
        host: host,
      port: port,
        path: getProductsByParams,
        queryParameters: {'sup_id': '${productInfoResp.supplier?.id ?? 1}',
        'sup_type': '', 'prod_type': ''},
    );

    Response resp = await get(getProdByParamsUri);
    if (resp.statusCode == 200) {
      final result = jsonDecode(resp.body);
      productResp = ProductsResponse.fromJson(result);
    } else {
      throw "Can't get products by parameters response!";
    }
  } catch (e) {
    print(e);
  }

  ProductPageInfo productPageInfo = ProductPageInfo(
    product: productInfoResp.product,
    supplier: productInfoResp.supplier,
    supList: productResp.products,
  );

  return productPageInfo;
}

Future<ProductsResponse> fetchProductsByParams(
    BuildContext context, Params params) async {
  if (params.supplierType == S.of(context).all) {
    params.supplierType = '';
  } else if (params.supplierType == S.of(context).open) {
    params.supplierType = 'workingHours';
  }
  if (params.prodType == S.of(context).all) params.prodType = '';

  final uri = Uri(
    scheme: scheme,
    host: host,
    port: port,
    path: getProductsByParams,
    queryParameters: {
      'sup_id': '${params.supplierId}',
      'sup_type': params.supplierType,
      'prod_type': params.prodType,
    },
  );
  print(uri);
  ProductsResponse resp = ProductsResponse(products: [], types: []);
  try {
    Response res = await get(uri);

    if (res.statusCode == 200) {
      final result = jsonDecode(res.body);
      resp = ProductsResponse.fromJson(result);
    } else {
      throw "Can't get products by parameters response!";
    }
  } catch (e) {
    print(e);
  }
  return resp;
}