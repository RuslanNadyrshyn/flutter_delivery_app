import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery/constants.dart';

import '../../http_service.dart';
import '../../models/supplier.dart';
import 'types_widget.dart';

class SuppliersListWidget extends StatefulWidget {
  const SuppliersListWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<SuppliersListWidget> createState() => _SuppliersListWidgetState();
}

// class _SuppliersListWidgetState extends State<SuppliersListWidget> {
//   // Future<List<Supplier>>? suppliers;
//   // Future<List<String>>? types;
//   // final supResp = getSuppliersResponse();
//   var resp = getSuppliersResponse();
//
//   //
//   // types = resp.then((value) => value.types);
//   // suppliers = resp.then((value) => value.suppliers);
//
//   @override
//   void initState() {
//     // Future<SuppliersResponse> supResp = getSuppliersResponse();
//     // print('supResp');
//     // print(supResp);
//     // var types = supResp.then((value) => value.types);
//     // supResp.then((value) => suppliers = value.suppliers);
//
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Provider.of<LocaleProvider>(context)
//         .setSuppliers(resp.then((value) => value.suppliers));
//     Provider.of<LocaleProvider>(context)
//         .setSuppliersTypes(resp.then((value) => value.types));
//
//     return Container(
//         height: 210,
//         decoration: listBoxDecoration(context),
//         child:
        // Column(
        //   children: [
        //     FutureBuilder<List<String>>(
        //         future: Provider.of<LocaleProvider>(context).suppliersTypes,
        //         builder: (context, snapshot) {
        //           if (snapshot.hasData) {
        //             List<String>? data = snapshot.data;
        //             return TypesWidget(
        //                 key: Key('supplier'), types: ["All", "Open"] + data!);
        //           } else if (snapshot.hasError) {
        //             return Text('${snapshot.error}');
        //           }
        //           return Center(
        //             child: const CircularProgressIndicator(),
        //           );
        //         }),
        //     Container(
        //         margin: EdgeInsets.symmetric(horizontal: 5),
        //         height: 170,
        //         width: double.infinity,
        //         child: FutureBuilder<List<Supplier>>(
        //             future: Provider.of<LocaleProvider>(context).suppliers,
        //             builder: (context, snapshot) {
        //               if (snapshot.hasData) {
        //                 List<Supplier>? data = snapshot.data;
        //                 return ListView(
        //                   scrollDirection: Axis.horizontal,
        //                   children: (data!
        //                       .map((supplier) =>
        //                           SupplierCardWidget(supplier: supplier))
        //                       .toList()),
        //                 );
        //               } else if (snapshot.hasError) {
        //                 return Text('${snapshot.error}');
        //               }
        //               return Center(
        //                 child: const CircularProgressIndicator(),
        //               );
        //             }))
        //   ],
        // )
//   }
// }


class _SuppliersListWidgetState extends State<SuppliersListWidget> {
  late List<String> types;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      decoration: listBoxDecoration(context),
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
                  height: 170,
                  width: double.infinity,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: (data.suppliers
                        .map((supplier) =>
                        SupplierCardWidget(supplier: supplier))
                        .toList()),
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


class SupplierCardWidget extends StatelessWidget {
  final Supplier supplier;

  const SupplierCardWidget({
    Key? key,
    required this.supplier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: cardBoxDecoration(context),
      margin: const EdgeInsets.all(5),
      width: 130,
      height: 150,
      padding: const EdgeInsets.all(10),
      // color: Theme.of(context).cardTheme.color,
      child: Column(
        children: [
          Center(
            child: Image.network(
              supplier.image,
              height: 80,
              errorBuilder: (context, error, stackTrace) => SvgPicture.network(
                supplier.image,
                height: 80,
              ),
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
