import 'package:coffeapp/core/utility/utility.dart';
import 'package:flutter/material.dart';

class EmptyShoppingCart extends StatelessWidget {
  const EmptyShoppingCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const _EmptyShoppingCartView(),
    );
  }
}

class _EmptyShoppingCartView extends StatelessWidget {
  const _EmptyShoppingCartView();

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    double _iconSize = 84;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.remove_shopping_cart_outlined,
            size: _iconSize,
            color: ColorConstants.darkBrown,
          ),
          Text(StringConstant.emptyCart)
        ],
      ),
    );
  }
}
