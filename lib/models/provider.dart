import 'package:flutter/material.dart';
import 'package:food_delivery/models/product.dart';


class LocaleProvider extends ChangeNotifier {
  Locale currentLocale = Locale('en');
  bool isAuthorized = false;

  String selectedSupplierType = 'All';
  String selectedProductType = 'All';

  List<Product> basket = [];

  void setLocale(Locale newLocale) {
    currentLocale = newLocale;
    notifyListeners();
  }

  void authorize() {
    isAuthorized = !isAuthorized;
    notifyListeners();
  }

  void setSupplierType(String type) {
    selectedSupplierType = type;
    notifyListeners();
  }

  void setProductType(String type) {
    selectedProductType = type;
    notifyListeners();
  }

  // void setSuppliers(Future<List<Supplier>> sup) {
  //   suppliers = sup;
  //   notifyListeners();
  // }

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
