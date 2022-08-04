import 'package:flutter/material.dart';
import 'package:food_delivery/http_service.dart';
import 'package:food_delivery/models/product.dart';
import 'package:food_delivery/models/supplier.dart';


class LocaleProvider extends ChangeNotifier {
  Locale currentLocale = Locale('en');
  bool isAuthorized = false;

  String selectedSupplierType = 'All';
  String selectedProductType = 'All';

  List<Product> basket = [];

  List<Supplier> suppliers = [];
  List<String> supTypes = [];

  List<Product> products = [];
  List<String> prodTypes = [];

  void setLocale(Locale newLocale) {
    currentLocale = newLocale;
    notifyListeners();
  }

  void authorize() {
    isAuthorized = !isAuthorized;
    notifyListeners();
  }

  void getSuppliers() async {
    var suppliersResponse = await getSuppliersResponse();
    suppliers = suppliersResponse.suppliers;
    supTypes = suppliersResponse.types;
    notifyListeners();
  }

  getSuppliersByType(String type, BuildContext context) async {
    selectedSupplierType = type;
    notifyListeners();
    suppliers = await getSuppliersByType1(type, context);           // Edit method name
    notifyListeners();
  }

  void getProducts() async {
    var productsResponse = await getProductsResponse();
    products = productsResponse.products;
    prodTypes = productsResponse.types;
    notifyListeners();
  }


  void addToBasket(Product product) {
    basket.add(product);
    notifyListeners();
  }

  void removeFromBasket(int id) {
    basket.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  void changeCounter(int index, int counter) {
    // final index = basket.indexWhere((element) => element.id == id);
    basket[index].counter = counter;
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
