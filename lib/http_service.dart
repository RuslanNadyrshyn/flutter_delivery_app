import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:food_delivery/models/product.dart';
import 'package:http/http.dart';

import 'generated/l10n.dart';
import 'models/supplier.dart';

const host = 'http://45.148.29.14:8080';

const String getAllSuppliersUrl = '$host/get_suppliers'; // Get all suppliers
const String getSuppliersByTypeUrl = '$host/get_sup_by_type';
const String getSuppliersByWorkingHoursUrl = '$host/get_sup_by_working_hours';

const String getAllProductsUrl = '$host/get_products';
const String getProductByIdUrl = '$host/get_prod_by_id';
const String getProductsByParamsUrl = '$host/get_prod_by_params';

class Params {
  int supplierId;
  String supplierType;
  String prodType;

  Params({required this.supplierId, required this.supplierType, required this.prodType});
}

Future<SuppliersResponse> getSuppliersResponse() async {
  SuppliersResponse resp = SuppliersResponse(suppliers: [], types: []);
  try {
  Response res = await get(Uri.parse(getAllSuppliersUrl));

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

Future<List<Supplier>> fetchSuppliersByType(String type, BuildContext context) async {
  if (type == S.of(context).all) {
    type = "";
  } else if (type == S.of(context).open) {
    type = "workingHours";
  }

  final str = '$getSuppliersByTypeUrl?type=$type';
  print(str);

  List<Supplier> suppliers = [];
  try {
    Response res = await get(Uri.parse(str));

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
  for (var element in suppliers) {print(element.name);}

  return suppliers;
}

Future<ProductsResponse> getProductsResponse() async {
  ProductsResponse resp = ProductsResponse(products: [], types: []);
  try {
    Response res = await get(Uri.parse(getAllProductsUrl));

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

Future<ProductInfo> getProductById(BuildContext context, int id) async {
  ProductInfo resp = ProductInfo(product: null, supplier: null);
  final str = '$getProductByIdUrl?id=$id';
  print(str);
  try {
    Response res = await get(Uri.parse(str));

    if (res.statusCode == 200) {
      final result = jsonDecode(res.body);
      resp = ProductInfo.fromJson(result);
    } else {
      throw "Can't get products by id response!";
    }
  } catch (e) {
    print(e);
  }
  return resp;
}

Future<ProductPageInfo> fetchProductPageInfo(BuildContext context, int id) async {
  ProductInfo productInfoResp = ProductInfo(product: null, supplier: null);
  ProductsResponse productResp = ProductsResponse(products: [], types: []);

  try {
    Response res = await get(Uri.parse('$getProductByIdUrl?id=$id'));
    if (res.statusCode == 200) {
      final result = jsonDecode(res.body);
      productInfoResp = ProductInfo.fromJson(result);
    } else {
      throw "Can't get products by id response!";
    }

    Response resp = await get(Uri.parse( '$getProductsByParamsUrl?'
        'sup_id=${productInfoResp.supplier?.id?? 1}&sup_type=&prod_type='));
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
    supList:  productResp.products,
  );

  return productPageInfo;
}

class ProductPageInfo {
  Product? product;
  Supplier? supplier;
  List<Product>? supList;

  ProductPageInfo({
    this.product,
    this.supplier,
    this.supList,
  });
}

Future<ProductsResponse> getProductsByParams(
    BuildContext context, Params params) async {
  if (params.supplierType == S.of(context).all) {
    params.supplierType = '';

  } else if (params.supplierType == S.of(context).open) {
    params.supplierType = 'workingHours';
  }
  if (params.prodType == S.of(context).all) params.prodType = '';

  final str = '$getProductsByParamsUrl?'
      'sup_id=${params.supplierId}'
      '&sup_type=${params.supplierType}'
      '&prod_type=${params.prodType}';
  print(str);
  ProductsResponse resp = ProductsResponse(products: [], types: []);
  try {
    Response res = await get(Uri.parse(str));

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
