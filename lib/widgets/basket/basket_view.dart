import 'package:flutter/material.dart';
import 'package:food_delivery/my_provider/basket_provider.dart';
import 'package:food_delivery/widgets/total_price_widget.dart';
import 'package:provider/provider.dart';

import '../../generated/l10n.dart';
import 'basket_list_widget.dart';

class BasketView extends StatefulWidget {
  const BasketView({Key? key}) : super(key: key);

  @override
  State<BasketView> createState() => _BasketViewState();
}

class _BasketViewState extends State<BasketView> {
  void _goToOrderView() {
    Navigator.of(context).pushNamed('/current_order');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(child: BasketListWidget()),
        Container(
          color: Theme.of(context).backgroundColor,
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TotalPriceWidget(textAlign: TextAlign.start),
              ElevatedButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(const EdgeInsets.all(10))),
                onPressed: Provider.of<BasketProvider>(context).basket.isEmpty
                      ? null
                      : _goToOrderView,
                child: Text(
                  S.of(context).to_order,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
