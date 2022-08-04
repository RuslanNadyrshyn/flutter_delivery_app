import 'package:flutter/material.dart';
import 'package:food_delivery/generated/l10n.dart';
import 'package:food_delivery/models/provider.dart';
import 'package:food_delivery/widgets/home/supplier_card.dart';
import 'package:provider/provider.dart';

import 'types_widget.dart';

class SuppliersListWidget extends StatelessWidget {
  const SuppliersListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var types = [S.of(context).all, S.of(context).open];
    types.addAll(Provider.of<LocaleProvider>(context).supTypes);

    return SizedBox(
      height: 200,
      child: ColoredBox(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          children: [
            TypesWidget(key: Key('supplier'), types: types),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              height: 155,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:
                    Provider.of<LocaleProvider>(context).suppliers.length,
                itemExtent: 130,
                itemBuilder: (BuildContext context, int index) {
                  return SupplierCardWidget(
                      supplier: Provider.of<LocaleProvider>(context)
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
