// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:auto_route/auto_route.dart';
import 'package:coffeapp/core/utility/constant/constant.dart';
import 'package:coffeapp/router/navigation/app_router.dart';
import 'package:coffeapp/view/components/components.dart';
import 'package:coffeapp/view/empty_cart_view.dart';
import 'package:coffeapp/viewmodel/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/organism/organisms_widgets.dart';

@RoutePage()
class ShoppingCartView extends StatelessWidget {
  const ShoppingCartView({super.key});

  @override
  Widget build(BuildContext context) {
    final isCartEmpty = Provider.of<CartViewModel>(context).isCartEmpty;
    return isCartEmpty
        ? const EmptyCartView()
        : Scaffold(
            appBar: AppBar(title: HeadlineSmallText(StringConstant.yourOrders)),
            body: const Padding(
                padding: PaddingConstant.screenPadding, child: _ViewWidget()));
  }
}

class _ViewWidget extends StatelessWidget {
  const _ViewWidget();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const OrderDetails(),
          const OrderTypeToggle(),
          Padding(
            padding: const EdgeInsets.only(top: 164.0),
            child: CustomButton(
                navigatorWidget: () => context.pushRoute(const OrderRoute()),
                buttonText: StringConstant.takeOrderText),
          )
        ],
      ),
    );
  }
}
