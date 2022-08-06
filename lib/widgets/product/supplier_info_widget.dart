import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/models/product.dart';
import 'package:food_delivery/models/provider.dart';
import 'package:food_delivery/widgets/effected_card_widget.dart';
import 'package:food_delivery/widgets/price_text_widget.dart';
import 'package:food_delivery/widgets/product_title_widget.dart';
import 'package:provider/provider.dart';

class SupplierInfoWidget extends StatelessWidget {
  const SupplierInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final supplier = Provider.of<GlobalProvider>(context).productInfo!.supplier!;
    return Container(
      color: Theme.of(context).backgroundColor,
      padding: EdgeInsets.all(10),
      width: double.infinity,
      child: Column(
        children: [
          Image.network(
            supplier.image,
            height: 100,
            errorBuilder: (context, error, stackTrace) => SvgPicture.network(
              supplier.image,
              height: 100,
            ),
          ),
          const SizedBox(height: 10),
          Text(supplier.name,
              style: TextStyle(fontSize: 24)),
          const SizedBox(height: 10),
          const _SupplierListWidget(),
        ],
      ),
    );
  }
}
class _SupplierListWidget extends StatelessWidget {
  const _SupplierListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: Provider.of<GlobalProvider>(context).supList.length,
        itemExtent: 135,
        itemBuilder: (BuildContext context, int index) {
          return _ProductCardWidget(product: Provider.of<GlobalProvider>(context).supList[index]);
        },
      ),
    );
  }
}


class _ProductCardWidget extends StatelessWidget {
  final Product product;

  const _ProductCardWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      EffectedCardWidget(
        padding: EdgeInsets.all(0),
        widget: Container(
          decoration: cardBoxDecoration(context),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          margin: EdgeInsets.all(5),
          child: Column(
            children: [
              Image.network(
                product.image,
                height: 70,
                width: 70,
                errorBuilder: (context, error, stackTrace) => SvgPicture.network(
                  product.image,
                  width: 70,
                  height: 70,
                ),
              ),
              const SizedBox(height: 5),
              ProductTitleWidget(name: product.name, fontSize: 15),
              const SizedBox(height: 5),
              SizedBox(
                width: double.infinity,
                child: PriceTextWidget(price: product.price, fontSize: 17, textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
        ),
        action: () => goToProductView(context, product.id),
      );
  }
}


