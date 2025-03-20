import 'package:coffeapp/model/cart_item.model.dart';
import 'package:coffeapp/model/product_model.dart';
import 'package:flutter/material.dart';

class CartViewModel extends ChangeNotifier {
  final List<CartItemModel> _cart = [];

  List<CartItemModel> get cart => _cart;
  bool get isCartEmpty => _cart.isEmpty;
  void increaseQuantity(CartItemModel item) {
    final index = _cart.indexWhere(
        (cartItem) => cartItem.id == item.id && cartItem.size == item.size);

    if (index != -1) {
      _cart[index] = _cart[index].copyWith(
        quantity: _cart[index].quantity + 1,
      );
      notifyListeners();
    }
  }

  void decreaseQuantity(CartItemModel item) {
    final index = _cart.indexWhere(
        (cartItem) => cartItem.id == item.id && cartItem.size == item.size);

    if (index != -1 && _cart[index].quantity > 1) {
      _cart[index] = _cart[index].copyWith(
        quantity: _cart[index].quantity - 1,
      );
      notifyListeners();
    }
  }

  void addToCart(ProductModel product) {
    final newItem = CartItemModel(
      id: product.id,
      image: product.image,
      name: product.name,
      category: product.category,
      size: product.sizes.entries.first.key,
      quantity: 1,
      price: product.basePrice,
    );

    final index = _cart.indexWhere(
        (item) => item.name == newItem.name && item.size == newItem.size);

    if (index != -1) {
      _cart[index] = _cart[index].copyWith(
        quantity: _cart[index].quantity + 1,
      );
    } else {
      _cart.add(newItem);
    }

    notifyListeners();
  }

  void removeFromCart(CartItemModel product) {
    _cart.remove(product);
    notifyListeners();
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }
}
