import 'package:coffeapp/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coffeapp/viewmodel/cart_view_model.dart';
import 'package:coffeapp/model/cart_item.model.dart';

class CartQuantityButton extends StatelessWidget {
  final ProductModel item;
  const CartQuantityButton({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<CartViewModel>();

    // ProductModel'den geçici bir CartItemModel üret
    final cartItemCandidate = CartItemModel(
      id: item.id,
      name: item.name,
      image: item.image,
      category: item.category,
      size: item.sizes.entries.first.key,
      price: item.basePrice,
      quantity: 1,
    );

    final index = cartProvider.cart.indexWhere((cartItem) =>
        cartItem.id == cartItemCandidate.id &&
        cartItem.size == cartItemCandidate.size);

    final currentItem =
        index != -1 ? cartProvider.cart[index] : cartItemCandidate;

    return Row(
      children: [
        IconButton(
          onPressed: () {
            if (currentItem.quantity > 1) {
              cartProvider.decreaseQuantity(currentItem);
            } else {
              cartProvider.removeFromCart(currentItem);
            }
          },
          icon: const Icon(Icons.remove),
        ),
        Text(currentItem.quantity.toString()),
        IconButton(
          onPressed: () => cartProvider.increaseQuantity(currentItem),
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
