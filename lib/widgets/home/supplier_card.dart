import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery/constants.dart';

import '../../models/supplier.dart';

class SupplierCardWidget extends StatelessWidget {
  final Supplier supplier;

  const SupplierCardWidget({
    Key? key,
    required this.supplier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: cardBoxDecoration(context).copyWith(
        color: Color.fromRGBO(150, 150, 150, 1),
      ),
      height: 140,
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.symmetric(horizontal: 3),
      child: Column(
        children: [
          Image.network(
            supplier.image,
            height: 85,
            errorBuilder: (context, error, stackTrace) => SvgPicture.network(
              supplier.image,
              height: 85,
            ),
          ),
          SizedBox(
            height: 40,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                supplier.name,
                style: TextStyle(fontSize: 17, height: 0.9),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Text(
              '${supplier.workingHours!.opening} - ${supplier.workingHours!.closing}'),
        ],
      ),
    );
  }
}
