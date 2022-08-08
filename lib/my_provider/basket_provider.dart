import 'package:flutter/material.dart';
import 'package:food_delivery/models/product.dart';

class BasketProvider extends ChangeNotifier {
  List<Product> basket = [];

  addToBasket(Product product) {
    basket.add(product);
    notifyListeners();
  }

  removeFromBasket(int id) {
    basket.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  clearBasket() {
    basket = [];
    notifyListeners();
  }

  changeCounter(int index, int counter) {
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