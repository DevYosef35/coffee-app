import 'package:coffeapp/model/coffe_model.dart';
import 'package:flutter/material.dart';

class CartViewModel extends ChangeNotifier {
  final List<Coffee> _cart = [];

  List<Coffee> get cart => _cart;
  bool get isCartEmpty => _cart.isEmpty;
  void addToCart(Coffee coffee) {
    final index =
        _cart.indexWhere((c) => c.name == coffee.name && c.size == coffee.size);
    if (index != -1) {
      _cart[index] = _cart[index].copyWith(quantity: _cart[index].quantity + 1);
    } else {
      _cart.add(coffee);
    }
    notifyListeners();
  }

  void removeFromCart(Coffee coffee) {
    _cart.remove(coffee);
    notifyListeners();
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }
}
