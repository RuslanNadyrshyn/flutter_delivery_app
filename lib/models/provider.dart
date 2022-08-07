import 'package:flutter/material.dart';
import 'package:food_delivery/http_service/auth_http.dart';
import 'package:food_delivery/http_service/order_http.dart';
import 'package:food_delivery/http_service/products_http.dart';
import 'package:food_delivery/http_service/suppliers_http.dart';
import 'package:food_delivery/models/auth.dart';
import 'package:food_delivery/models/order.dart';
import 'package:food_delivery/models/product.dart';
import 'package:food_delivery/models/supplier.dart';
import 'package:food_delivery/models/user.dart';


class GlobalProvider extends ChangeNotifier {
  Locale currentLocale = const Locale('en');

  bool isAuthorized = false;
  String accessToken = '';
  String refreshToken = '';
  String? authErrorMessage;

  User? user;
  List<OrderResponse> userOrders = [];

  int selectedSupplierId = 0;
  String selectedSupplierType = '';
  String selectedProductType = '';

  List<Product> basket = [];

  List<Supplier> suppliers = [];
  List<String> supTypes = [];

  List<Product> products = [];
  List<String> prodTypes = [];

  ProductPageInfo? productPageInfo;



  setLocale(Locale newLocale) {
    currentLocale = newLocale;
    notifyListeners();
  }

  authorize() {
    isAuthorized = !isAuthorized;
    notifyListeners();
  }

  // Suppliers
  getSuppliers() async {
    final suppliersResponse = await fetchSuppliers();
    suppliers = suppliersResponse.suppliers;
    supTypes = suppliersResponse.types;
    notifyListeners();
  }

  getSuppliersByType(String type, BuildContext context) async {
    getProductsWithParams(context, Params(
        supplierId: 0,
        supplierType: type,
        prodType: ''));

    suppliers = await fetchSuppliersByType(type, context);
    notifyListeners();
  }

  // Products
  getProducts() async {
    var productsResponse = await fetchProducts();
    products = productsResponse.products;
    prodTypes = productsResponse.types;
    notifyListeners();
  }

  getProductsWithParams(BuildContext context, Params params) async {
    selectedSupplierId = params.supplierId;
    selectedSupplierType = params.supplierType;
    selectedProductType = params.prodType;
    notifyListeners();

    var productsResponse = await fetchProductsByParams(context, params);
    if (productsResponse.products.isNotEmpty) {
      products = productsResponse.products;
      prodTypes = productsResponse.types;
      notifyListeners();
    }
  }

  getProductPageInfo(BuildContext context, int id) async {
    productPageInfo = null;
    notifyListeners();

    final productPageResp = await fetchProductPageInfo(context, id);
    productPageInfo = productPageResp;
    notifyListeners();
  }

  // Basket
  addToBasket(Product product) {
    basket.add(product);
    notifyListeners();
  }

  removeFromBasket(int id) {
    basket.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  changeCounter(int index, int counter) {
    basket[index].counter = counter;
    notifyListeners();
  }

  // Auth
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

double countTotal(List<Product> products) {
  double sum = 0.0;
  for (var p in products) {
    sum += p.price*p.counter!;
  }
  return sum;
}
