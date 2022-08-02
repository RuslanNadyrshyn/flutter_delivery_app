import 'package:flutter/material.dart';
import 'package:food_delivery/models/provider.dart';
import 'package:provider/provider.dart';

import '../../generated/l10n.dart';
import 'basket_list_widget.dart';

class BasketView extends StatelessWidget {

  const BasketView({Key? key}) : super(key: key);

  void _goToOrderView(BuildContext context) {
    Navigator.of(context).pushNamed('/current_order');
  }

  @override
  Widget build(BuildContext context) {

    final total = countTotal(Provider.of<LocaleProvider>(context).basket).toStringAsFixed(2);

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Expanded(child: BasketListWidget()),
          SizedBox(
            height: 100,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${S.of(context).total}: $total',
                    style: TextStyle(fontSize: 24),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.all(10))),
                    onPressed: () => _goToOrderView(context),
                    child: Text(
                      S.of(context).to_order,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
