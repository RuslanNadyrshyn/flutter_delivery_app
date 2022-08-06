import 'package:flutter/material.dart';
import 'package:food_delivery/models/provider.dart';
import 'package:food_delivery/widgets/product/product_info_widget.dart';
import 'package:food_delivery/widgets/product/supplier_info_widget.dart';
import 'package:provider/provider.dart';

class ProductView extends StatelessWidget {
  final int productId;
  const ProductView({Key? key, required this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Provider.of<GlobalProvider>(context).productPageInfo != null ?
      ListView(
        children: const [
          ProductInfoWidget(),
          SizedBox(height: 5),
          SupplierInfoWidget(),
        ],
      ) :
      const Center(child: CircularProgressIndicator())
    );
  }
}
