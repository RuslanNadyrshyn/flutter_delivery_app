import 'package:flutter/material.dart';

import 'supplier.dart';

class LocaleProvider extends ChangeNotifier {
  Locale currentLocale = Locale('en');
  bool isAuthorized = false;

  String selectedSupplierType = 'All';
  String selectedProductType = 'All';

  Future<List<Supplier>>? suppliers;
  Future<List<String>>? suppliersTypes;

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
  void setSuppliers(Future<List<Supplier>> sup) {
    suppliers = sup;
    notifyListeners();
  }
  void setSuppliersTypes(Future<List<String>> types) {
    suppliersTypes = types;
    notifyListeners();
  }
}