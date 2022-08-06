import 'package:flutter/material.dart';
import 'package:food_delivery/http_service.dart';
import 'package:food_delivery/models/product.dart';
import 'package:food_delivery/models/supplier.dart';


class LocaleProvider extends ChangeNotifier {
  Locale currentLocale = Locale('en');
  bool isAuthorized = false;

  int selectedSupplierId = 0;
  String selectedSupplierType = '';
  String selectedProductType = '';

  List<Product> basket = [];

  List<Supplier> suppliers = [];
  List<String> supTypes = [];

  List<Product> products = [];
  List<String> prodTypes = [];

  ProductInfo? productInfo;

  getProductPageInfo(BuildContext context, int id) async {
    productInfo = null;
    notifyListeners();

    final productResp = await getProductById(context, id);
    productInfo = productResp;
    notifyListeners();
  }


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
    final suppliersResponse = await getSuppliersResponse();
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
    var productsResponse = await getProductsResponse();
    products = productsResponse.products;
    prodTypes = productsResponse.types;
    notifyListeners();
  }

  getProductsWithParams(BuildContext context, Params params) async {
    selectedSupplierId = params.supplierId;
    selectedSupplierType = params.supplierType;
    selectedProductType = params.prodType;
    notifyListeners();

    var productsResponse = await getProductsByParams(context, params);
    if (productsResponse.products.isNotEmpty) {
      products = productsResponse.products;
      prodTypes = productsResponse.types;
      notifyListeners();
    }
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
}

double countTotal(List<Product> products) {
  double sum = 0.0;
  for (var p in products) {
    sum += p.price*p.counter!;
  }
  return sum;
}
