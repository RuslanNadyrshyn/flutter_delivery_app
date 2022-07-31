import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../http_service.dart';
import '../../models/provider.dart';

class TypesWidget extends StatelessWidget {
  final List<String> types;
  const TypesWidget({Key? key, required this.types}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String selectedSupplierType =
        Provider.of<LocaleProvider>(context).selectedSupplierType;
    String selectedProductType =
        Provider.of<LocaleProvider>(context).selectedProductType;

    MaterialStateProperty<Color> selectedColor =
        MaterialStateProperty.all<Color>(Colors.orangeAccent);

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: (types
            .map(
              (type) => Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
                child: ElevatedButton(
                  onPressed: () {
                    if (key == Key('supplier')) {
                      print('getting suppliers by type $type');
                      Provider.of<LocaleProvider>(context, listen: false)
                          .setSupplierType(type);
                      // Provider.of<LocaleProvider>(context, listen: false).setProductType('All');
                      getSuppliersByType(type);
                      // getProductsByParams(context, Params(0, "restaurant", "burger"));
                    } else if (key == Key('product')) {
                      print('getting product by type $type');
                      Provider.of<LocaleProvider>(context, listen: false)
                          .setProductType(type);
                      // getProductsByParams(context, Params(0, "restaurant", "burger"));
                    }
                  },
                  style: selectedSupplierType == type &&
                              key == Key('supplier') ||
                          selectedProductType == type && key == Key('product')
                      ? ButtonStyle(backgroundColor: selectedColor)
                      : ButtonStyle(),
                  child: Text(type),
                ),
              ),
            )
            .toList()),
      ),
    );
  }
}
