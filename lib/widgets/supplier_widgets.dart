import 'package:flutter/material.dart';

import '../http_service.dart';
import '../models/supplier.dart';
import 'widgets.dart';

class SuppliersListWidget extends StatefulWidget {
  const SuppliersListWidget({Key? key}) : super(key: key);

  @override
  State<SuppliersListWidget> createState() => _SuppliersListWidgetState();
}

class _SuppliersListWidgetState extends State<SuppliersListWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SuppliersResponse>(
      future: getSuppliersResponse(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          SuppliersResponse? data = snapshot.data;

          return Column(
            children: [
              TypesWidget(types: ["All", "Open"] + data!.types),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                height: 190,
                color: Theme.of(context).appBarTheme.backgroundColor,
                width: double.infinity,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: (data.suppliers
                      .map((supplier) => SupplierCardWidget(supplier: supplier))
                      .toList()),
                ),
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }
}

class SupplierCardWidget extends StatelessWidget {
  final Supplier supplier;

  const SupplierCardWidget({
    Key? key,
    required this.supplier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: 130,
      height: 170,
      padding: const EdgeInsets.all(10),
      color: Theme.of(context).cardTheme.color,
      child: Column(
        children: [
          Center(
            child: Image.network(
              supplier.image,
              height: 100,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            supplier.name,
            style: TextStyle(fontSize: 20),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),
          Text(
              '${supplier.workingHours!.opening} - ${supplier.workingHours!.closing}'),
        ],
      ),
    );
  }
}