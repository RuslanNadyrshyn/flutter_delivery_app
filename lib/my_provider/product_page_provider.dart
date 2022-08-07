import 'package:flutter/material.dart';
import 'package:food_delivery/http_service/products_http.dart';
import 'package:food_delivery/models/product.dart';

class ProductPageInfoProvider extends ChangeNotifier {
  ProductPageInfo? productPageInfo;

  getProductPageInfo(BuildContext context, int id) async {
    productPageInfo = null;
    notifyListeners();

    final productPageResp = await fetchProductPageInfo(context, id);
    productPageInfo = productPageResp;
    notifyListeners();
  }
}