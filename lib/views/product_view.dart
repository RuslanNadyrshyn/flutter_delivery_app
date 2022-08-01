import 'package:flutter/material.dart';
import 'package:food_delivery/models/supplier.dart';

import '../generated/l10n.dart';
import '../models/product.dart';

class ProductPageResponse {
  Product product;
  Supplier supplier;

  ProductPageResponse({required this.product, required this.supplier});
}

// Future<ProductPageResponse> GetProductById(int id) async {
//   try {
//     Response res = await get(Uri.parse(getAllSuppliersUrl));
//
//     if (res.statusCode == 200) {
//       final result = jsonDecode(res.body);
//       resp = SuppliersResponse.fromJson(result);
//     } else {
//       throw "Can't get suppliers response!";
//     }
//   } catch (e) {
//     print(e);
//   }
//   return resp;
// }

class ProductView extends StatelessWidget {
  final Product? product;
  const ProductView({Key? key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: ListView(
          children: [
            Column(
              children: [
                Center(
                    child: Image.network(
                      args.image,
                    )),
                const SizedBox(height: 15),
                Text(
                  args.name,
                  style: TextStyle(fontSize: 30),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        '${args.price} \$',
                        style: TextStyle(fontSize: 30),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
                      ),
                      onPressed: () {},
                      child: Text(
                        S.of(context).add_btn,
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: args.ingredients
                      .map((e) => Text(e, style: TextStyle(fontSize: 25))).toList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
