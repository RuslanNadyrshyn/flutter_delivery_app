
import 'package:flutter/material.dart';
import 'package:food_delivery/http_service/auth_http.dart';
import 'package:food_delivery/http_service/order_http.dart';
import 'package:food_delivery/models/auth.dart';
import 'package:food_delivery/models/order.dart';
import 'package:food_delivery/models/user.dart';

class AuthProvider extends ChangeNotifier {
  bool isAuthorized = false;
  String accessToken = '';
  String refreshToken = '';
  String? authErrorMessage;

  User? user;
  List<OrderResponse> userOrders = [];

  authorize() {
    isAuthorized = !isAuthorized;
    notifyListeners();
  }

  login(String email, String password) async {
    isAuthorized = false;
    notifyListeners();
    print('$email $password');

    if (email.length < 4 || password.length < 4) {
      authErrorMessage = 'Wrong input, try again';

      notifyListeners();
      Future.delayed(const Duration(seconds: 5), () {
        authErrorMessage = null;
        notifyListeners();
      });
      return;
    }

    final LoginResponse loginResponse = await loginAuth(email, password);

    accessToken = loginResponse.accessToken;
    refreshToken = loginResponse.refreshToken;
    if (loginResponse.accessToken == '401') {
      authErrorMessage = 'Wrong email or password. Try again.';
    } else if (loginResponse.accessToken.isNotEmpty) {
      isAuthorized = true;
      getUserProfile();
    }
  }
  getUserProfile() async {
    print('getting user profile');
    User userResp = await fetchProfile(accessToken);
    print('user ${userResp.name}');
    user = userResp;
    notifyListeners();

    print('getting user orders');
    List<OrderResponse> ordersResp = await fetchOrders(accessToken);
    userOrders = ordersResp;

    notifyListeners();
  }
}