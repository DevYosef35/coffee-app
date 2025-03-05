// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:coffeapp/core/utility/constant/constant.dart';
import 'package:coffeapp/view/components/components.dart';
import 'package:coffeapp/view/order_view.dart';
import 'package:flutter/material.dart';

class ShoppingCartView extends StatelessWidget {
  const ShoppingCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: HeadlineSmallText(StringConstant.yourOrders)),
        body: Padding(
            padding: PaddingConstant.screenPadding,
            child: ListView(
              children: const [
                _ViewWidget(),
              ],
            )));
  }
}

class _ViewWidget extends StatelessWidget {
  const _ViewWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const OrderDetails(),
        const OrderTypeToggle(),
        CustomButton(
            navigatorWidget: OrderView(
                imgPath:
                    "assets/americano_coffe_cup.jpg"), //Burası dummy düzelt!!
            buttonText: StringConstant.takeOrderText)
      ],
    );
  }
}
