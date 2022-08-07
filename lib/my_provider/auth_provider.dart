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
  String? loginErrorMessage;
  String? signUpErrorMessage;
  bool loading = false;

  User? user;
  List<OrderResponse> userOrders = [];

  authorize() {
    isAuthorized = !isAuthorized;
    notifyListeners();
  }

  login(String email, String password) async {
    isAuthorized = false;
    notifyListeners();

    if (email.length < 4 || password.length < 4) {
      loginErrorMessage = 'Wrong input, try again';

      notifyListeners();
      Future.delayed(const Duration(seconds: 5), () {
        loginErrorMessage = null;
        notifyListeners();
      });
      return;
    }

    loading = true;
    notifyListeners();

    final LoginResponse loginResponse = await loginAuth(email, password);

    accessToken = loginResponse.accessToken;
    refreshToken = loginResponse.refreshToken;
    if (loginResponse.accessToken == '401') {
      loginErrorMessage = 'Wrong email or password. Try again.';
    } else if (loginResponse.accessToken.isNotEmpty) {
      isAuthorized = true;
      getUserProfile();
    }

    loading = false;
    notifyListeners();
  }

  signUp(String name, String email, String password) async {
    if (name.length < 4 || email.length < 4 || password.length < 4) {
      signUpErrorMessage = 'Wrong input, try again';
      notifyListeners();

      Future.delayed(const Duration(seconds: 5), () {
        loginErrorMessage = null;
        notifyListeners();
      });
      return;
    }
    loading = true;
    notifyListeners();

    final SignUpResponse signUpResponse = await signUpAuth(name, email, password);

    if (signUpResponse.errorMessage != null) {
      signUpErrorMessage = signUpResponse.errorMessage;
    } else {
      login(email, password);
    }

    loading = false;
    notifyListeners();
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