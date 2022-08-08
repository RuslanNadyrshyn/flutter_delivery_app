import 'package:flutter/material.dart';
import 'package:food_delivery/models/order.dart';
import 'package:food_delivery/models/user.dart';
import 'package:food_delivery/my_provider/auth_provider.dart';
import 'package:food_delivery/my_provider/basket_provider.dart';
import 'package:food_delivery/my_provider/order_provider.dart';
import 'package:food_delivery/widgets/text_field_widget.dart';
import 'package:provider/provider.dart';

import '../../../generated/l10n.dart';

class OrderFormWidget extends StatefulWidget {
  const OrderFormWidget({Key? key}) : super(key: key);

  @override
  State<OrderFormWidget> createState() => _OrderFormWidgetState();
}

class _OrderFormWidgetState extends State<OrderFormWidget> {
  final _nameTextController = TextEditingController();
  final _addressTextController = TextEditingController();

  void _makeOrder() async {
    OrderRequest orderRequest = OrderRequest(
      user: User(
        id: Provider.of<AuthProvider>(context, listen: false).user?.id ?? 0,
        name: Provider.of<AuthProvider>(context, listen: false).user?.name ??
            _nameTextController.text,
        email: '',
      ),

      totalPrice: countTotal(
          Provider.of<BasketProvider>(context, listen: false).basket),
      address: _addressTextController.text,
      products: Provider.of<BasketProvider>(context, listen: false).basket,
    );

    if (Provider.of<AuthProvider>(context, listen: false).isAuthorized) {
      Provider.of<OrderProvider>(context, listen: false)
          .postOrder(context, isAuthorized: true, orderRequest);
    } else {
      Provider.of<OrderProvider>(context, listen: false)
          .postOrder(context, isAuthorized: false, orderRequest);
    }
  }

  @override
  Widget build(BuildContext context) {
    var errorMessage = Provider.of<OrderProvider>(context).errorMessage;

    if (Provider.of<OrderProvider>(context).isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (Provider.of<OrderProvider>(context).orderId != null) {
      return const _OrderSuccessWidget();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 26,
          child: errorMessage != null ? Text(errorMessage) : null,
        ),
        if (!Provider.of<AuthProvider>(context).isAuthorized) ...[
          TextFieldWidget(
            title: S.of(context).name,
            controller: _nameTextController,
          ),
          const SizedBox(height: 15),
        ],
        TextFieldWidget(
          title: S.of(context).address,
          controller: _addressTextController,
        ),
        const SizedBox(height: 15),
        Center(
          child: ElevatedButton(
            onPressed: _makeOrder,
            style: ButtonStyle(
                padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
            )),
            child: Text(
              S.of(context).make_order,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }
}

class _OrderSuccessWidget extends StatelessWidget {
  const _OrderSuccessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderId = Provider.of<OrderProvider>(context).orderId;
    return SizedBox(
      height: 200,
      child: Center(
        child: Text(
          'Success. Your order id is: $orderId.',
          style: const TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
