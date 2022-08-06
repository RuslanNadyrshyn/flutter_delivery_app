import 'package:flutter/material.dart';
import 'package:food_delivery/models/provider.dart';
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
        Expanded(child: BasketListWidget()),
        Container(
          color: Theme.of(context).backgroundColor,
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TotalPriceWidget(textAlign: TextAlign.start),
              ElevatedButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.all(10))),
                onPressed: Provider.of<GlobalProvider>(context).basket.isEmpty
                      ? null
                      : _goToOrderView,
                child: Text(
                  S.of(context).to_order,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
