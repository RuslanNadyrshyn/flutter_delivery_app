import 'package:flutter/material.dart';
import 'package:food_delivery/generated/l10n.dart';
import 'package:food_delivery/my_provider/home_view_provider.dart';
import 'package:food_delivery/widgets/home/supplier_card_widget.dart';
import 'package:provider/provider.dart';

import 'types_widget.dart';

class SuppliersListWidget extends StatelessWidget {
  const SuppliersListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> types = ['', S.of(context).open];
    types.addAll(Provider.of<HomeViewProvider>(context).supTypes);

    return SizedBox(
      height: 200,
      child: ColoredBox(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          children: [
            TypesWidget(types: types, parent: 'supplier'),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              height: 145,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:
                    Provider.of<HomeViewProvider>(context).suppliers.length,
                itemExtent: 115,
                itemBuilder: (BuildContext context, int index) {
                  return SupplierCardWidget(
                      supplier: Provider.of<HomeViewProvider>(context)
                          .suppliers[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
