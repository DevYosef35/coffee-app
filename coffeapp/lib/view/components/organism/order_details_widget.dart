import 'package:coffeapp/viewmodel/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/utility/utility.dart';
import '../atoms/atomic_widgets.dart';
import '../molecules/molecules_widgets.dart';
import '../../../model/cart_item.model.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final coffeeList = Provider.of<CartViewModel>(context).cart;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeadlineSmallText(StringConstant.orderDetailText),
        Flexible(
          fit: FlexFit.loose,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: coffeeList.length,
            itemBuilder: (BuildContext context, int index) {
              final coffee = coffeeList[index];
              return Card(
                elevation: 4,
                child: Dismissible(
                  onDismissed: (direction) =>
                      context.read<CartViewModel>().removeFromCart(coffee),
                  key: Key(coffee.name + coffee.size),
                  child: ListTile(
                    leading: Image.asset(coffee.image),
                    title: Text(coffee.name),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(coffee.size.toString()),
                        CartQuantityButton(item: coffee),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const Divider(),
        const OrderPriceDetails(),
        const Divider(),
      ],
    );
  }
}

class CartQuantityButton extends StatelessWidget {
  final CartItemModel item;
  const CartQuantityButton({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<CartViewModel>();

    return Row(
      children: [
        IconButton(
          onPressed: () {
            if (item.quantity > 1) {
              cartProvider.decreaseQuantity(item);
            } else {
              cartProvider.removeFromCart(item);
            }
          },
          icon: const Icon(Icons.remove),
        ),
        Text(item.quantity.toString()),
        IconButton(
          onPressed: () => cartProvider.increaseQuantity(item),
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
