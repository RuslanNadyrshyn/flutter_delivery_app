import 'package:flutter/material.dart';
import 'package:food_delivery/http_service/order_http.dart';
import 'package:food_delivery/models/order.dart';

class OrderProvider extends ChangeNotifier {
  int? orderId;
  String? errorMessage;
  bool isLoading = false;

  nullOrderId() {
    orderId = null;
    notifyListeners();
  }

  postOrder(BuildContext context, OrderRequest orderRequest, {required bool isAuthorized}) async {
    if (orderRequest.address.isNotEmpty) {
      if (!isAuthorized && orderRequest.user.name.isEmpty) {
        errorMessage = 'Input name!';
        notifyListeners();
        return;
      }
      isLoading = true;
      notifyListeners();

      orderId = await postOrderRequest(orderRequest);
    } else {
      errorMessage = 'Input address!';
    }

    isLoading = false;
    notifyListeners();
  }
}