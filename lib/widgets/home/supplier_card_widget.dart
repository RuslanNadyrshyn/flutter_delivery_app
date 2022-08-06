import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/http_service.dart';
import 'package:food_delivery/models/provider.dart';
import 'package:food_delivery/widgets/effected_card_widget.dart';
import 'package:food_delivery/widgets/product_title_widget.dart';
import 'package:provider/provider.dart';

import '../../models/supplier.dart';

class SupplierCardWidget extends StatelessWidget {
  final Supplier supplier;

  const SupplierCardWidget({
    Key? key,
    required this.supplier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var supType = Provider.of<GlobalProvider>(context).selectedSupplierType;

    return EffectedCardWidget(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      widget: _SupplierCardInfoWidget(supplier: supplier),
      action: () => Provider.of<GlobalProvider>(context, listen: false)
          .getProductsWithParams(
              context,
              Params(
                supplierId: supplier.id,
                supplierType: supType,
                prodType: '',
              )),
    );
  }
}

class _SupplierCardInfoWidget extends StatelessWidget {
  final Supplier supplier;

  const _SupplierCardInfoWidget({Key? key, required this.supplier})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var supId = Provider.of<GlobalProvider>(context).selectedSupplierId;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 2),
      decoration: cardBoxDecoration(context).copyWith(
        color: supplier.id == supId
            ? Colors.green
            : const Color.fromRGBO(150, 150, 150, 1)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            supplier.image,
            height: 85,
            errorBuilder: (context, error, stackTrace) => SvgPicture.network(
              supplier.image,
              height: 85,
            ),
          ),
          ProductTitleWidget(
            name: supplier.name,
            fontSize: 17,
            height: 0.9,
          ),
          Text(
              '${supplier.workingHours!.opening} - ${supplier.workingHours!.closing}'),
        ],
      ),
    );
  }
}
