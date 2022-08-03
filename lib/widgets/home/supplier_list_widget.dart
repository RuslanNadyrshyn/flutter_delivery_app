import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/home/supplier_card.dart';

import '../../http_service.dart';
import '../../models/supplier.dart';
import 'types_widget.dart';

class SuppliersListWidget extends StatelessWidget {
  const SuppliersListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Theme.of(context).backgroundColor,
      child: FutureBuilder<SuppliersResponse>(
        future: getSuppliersResponse(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            SuppliersResponse? data = snapshot.data;
            return Column(
              children: [
                TypesWidget(
                    key: Key('supplier'), types: ["All", "Open"] + data!.types),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  height: 155,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data.suppliers.length,
                    itemExtent: 130,
                    itemBuilder: (BuildContext context, int index) {
                      return SupplierCardWidget(supplier: data.suppliers[index]);
                    },
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return Center(
            child: const CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

