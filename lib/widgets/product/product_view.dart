import 'package:flutter/material.dart';
import 'package:food_delivery/models/supplier.dart';
import 'package:food_delivery/widgets/product/product_info_widget.dart';
import 'package:food_delivery/widgets/product/supplier_info_widget.dart';

import '../../models/product.dart';

class ProductView extends StatelessWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Product;
    // final productPageResponse = ProductPageResponse(
    //   product: args,
    //   supplier: Supplier(
    //       id: 1,
    //       name: 'dsada',
    //       type: 'fdsfsd',
    //       image: 'fdsd',
    //       workingHours: WorkingHours(opening: '12:00', closing: '20:00')),
    // );

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          ProductInfoWidget(product: args),
          SupplierInfoWidget(product: args),
        ],
      ),
    );
  }
}


class ProductPageResponse {
  Product product;
  Supplier supplier;

  ProductPageResponse({required this.product, required this.supplier});
}


// Future<ProductPageResponse> GetProductById(int id) async {
//   try {
//     Response res = await get(Uri.parse(getAllSuppliersUrl));
//
//     if (res.statusCode == 200) {
//       final result = jsonDecode(res.body);
//       resp = SuppliersResponse.fromJson(result);
//     } else {
//       throw "Can't get suppliers response!";
//     }
//   } catch (e) {
//     print(e);
//   }
//   return resp;
// }