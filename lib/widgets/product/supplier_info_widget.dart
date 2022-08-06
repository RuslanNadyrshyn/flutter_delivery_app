import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery/models/provider.dart';
import 'package:provider/provider.dart';

class SupplierInfoWidget extends StatelessWidget {
  const SupplierInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      padding: EdgeInsets.all(10),
      width: double.infinity,
      child: Column(
        children: [
          Image.network(
            Provider.of<LocaleProvider>(context).productInfo!.supplier!.image,
            height: 100,
            errorBuilder: (context, error, stackTrace) => SvgPicture.network(
              Provider.of<LocaleProvider>(context).productInfo!.supplier!.image,
              height: 100,
            ),
          ),
          const SizedBox(height: 10),
          Text(Provider.of<LocaleProvider>(context).productInfo!.supplier!.name,
              style: TextStyle(fontSize: 24)),
        ],
      ),
    );
  }
}

