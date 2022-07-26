import 'package:flutter/material.dart';
import 'package:food_delivery/http_service.dart';

class TypesWidget extends StatelessWidget {
  final List<String> types;
  const TypesWidget({Key? key, required this.types}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Theme.of(context).appBarTheme.backgroundColor,
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: (types
            .map((type) => Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
                child: ElevatedButton(
                    onPressed: () {
                      if (key == Key('supplier')) {
                        print('getting suppliers by type $type');
                        getSuppliersByType(type);
                        // getProductsByParams(context, Params(0, "restaurant", "burger"));
                      } else if (key == Key('product')) {
                        print('getting product by type $type');
                        // getProductsByParams(context, Params(0, "restaurant", "burger"));
                      }
                    },
                    child: Text(type))))
            .toList()),
      ),
    );
  }
}
