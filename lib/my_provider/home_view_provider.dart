import 'package:flutter/material.dart';
import 'package:food_delivery/http_service/products_http.dart';
import 'package:food_delivery/http_service/suppliers_http.dart';
import 'package:food_delivery/models/product.dart';
import 'package:food_delivery/models/supplier.dart';

class HomeViewProvider extends ChangeNotifier {
  int selectedSupplierId = 0;
  String selectedSupplierType = '';
  String selectedProductType = '';

  List<Supplier> suppliers = [];
  List<String> supTypes = [];

  List<Product> products = [];
  List<String> prodTypes = [];

  bool suppliersLoading = false;
  bool productsLoading = false;

  // Suppliers
  getSuppliers() async {
    final suppliersResponse = await fetchSuppliers();
    suppliers = suppliersResponse.suppliers;
    supTypes = suppliersResponse.types;
    notifyListeners();
  }

  getSuppliersByType(String type, BuildContext context) async {
    suppliersLoading = true;
    notifyListeners();

    getProductsWithParams(context, Params(
        supplierId: 0,
        supplierType: type,
        prodType: ''));

    suppliers = await fetchSuppliersByType(type, context);

    suppliersLoading = false;
    notifyListeners();
  }

  // Products
  getProducts() async {
    // productsLoading = true;
    // notifyListeners();

    var productsResponse = await fetchProducts();
    products = productsResponse.products;
    prodTypes = productsResponse.types;

    // productsLoading = false;
    notifyListeners();
  }

  getProductsWithParams(BuildContext context, Params params) async {
    productsLoading = true;

    selectedSupplierId = params.supplierId;
    selectedSupplierType = params.supplierType;
    selectedProductType = params.prodType;
    notifyListeners();

    var productsResponse = await fetchProductsByParams(context, params);
    if (productsResponse.products.isNotEmpty) {
      products = productsResponse.products;
      prodTypes = productsResponse.types;
    }

    productsLoading = false;
    notifyListeners();
  }
}
