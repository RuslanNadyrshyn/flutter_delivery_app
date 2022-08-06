import 'package:flutter/material.dart';
import 'package:food_delivery/generated/l10n.dart';
import 'package:food_delivery/models/provider.dart';
import 'package:food_delivery/widgets/basket/basket_card_widget.dart';
import 'package:provider/provider.dart';


class BasketListWidget extends StatelessWidget {
  const BasketListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Provider.of<GlobalProvider>(context).basket.isEmpty
          ? Center(child: Text(S.of(context).basket_is_empty))
          : ListView.builder(
              itemCount: Provider.of<GlobalProvider>(context).basket.length,
              itemExtent: 120,
              itemBuilder: (BuildContext context, int index) {
                final product =
                    Provider.of<GlobalProvider>(context).basket[index];
                return BasketCardWidget(product: product, index: index);
              },
            ),
    );
  }
}
