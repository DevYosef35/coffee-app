import 'package:flutter/material.dart';

class CardQuantityViewModel extends ChangeNotifier {
  final Map<String, int> _quantities = {}; // coffee name -> quantity

  int getQuantity(String coffeeName) => _quantities[coffeeName] ?? 1;

  void increment(String coffeeName) {
    _quantities[coffeeName] = getQuantity(coffeeName) + 1;
    notifyListeners();
  }

  void decrement(String coffeeName) {
    final current = getQuantity(coffeeName);
    if (current > 1) {
      _quantities[coffeeName] = current - 1;
      notifyListeners();
    }
  }
}
