import 'package:flutter/material.dart';
import 'package:food_delivery/generated/l10n.dart';
import 'package:food_delivery/models/product.dart';
import 'package:provider/provider.dart';

import '../../models/provider.dart';

class TypesWidget extends StatelessWidget {
  final List<String> types;
  final String parent;

  const TypesWidget({Key? key, required this.types, required this.parent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: SizedBox(
        height: 40,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: (types
              .map((type) => _TypeButtonWidget(
                    type: type,
                    parent: parent,
                  ))
              .toList()),
        ),
      ),
    );
  }
}

class _TypeButtonWidget extends StatelessWidget {
  final String type;
  final String parent;

  const _TypeButtonWidget({Key? key, required this.type, required this.parent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String selectedSupplierType =
        Provider.of<GlobalProvider>(context).selectedSupplierType;
    String selectedProductType =
        Provider.of<GlobalProvider>(context).selectedProductType;
    int selectedSupplierId =
        Provider.of<GlobalProvider>(context).selectedSupplierId;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 2),
      child: ElevatedButton(
        onPressed: () {
          if (parent == 'supplier' && type != selectedSupplierType) {
            Provider.of<GlobalProvider>(context, listen: false)
                .getSuppliersByType(type, context);
          } else if (parent == 'product' && type != selectedProductType) {
            Provider.of<GlobalProvider>(context, listen: false)
                .getProductsWithParams(context,
                    Params(
                      supplierId: selectedSupplierId,
                      supplierType: selectedSupplierType,
                      prodType: type,
                    ));
          }
        },
        style: _getTypeButtonStyle(context, type, parent),
        child: type == '' ? Text(S.of(context).all) : Text(type),
      ),
    );
  }
}

ButtonStyle _getTypeButtonStyle(
    BuildContext context, String type, String parent) {
  String selectedSupplierType =
      Provider.of<GlobalProvider>(context).selectedSupplierType;
  String selectedProductType =
      Provider.of<GlobalProvider>(context).selectedProductType;

  final selectedColor = MaterialStateProperty.all<Color>(Colors.green);

  return selectedSupplierType == type && parent == 'supplier' ||
          selectedProductType == type && parent == 'product'
      ? ButtonStyle(backgroundColor: selectedColor)
      : const ButtonStyle();
}
