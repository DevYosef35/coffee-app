import 'package:coffeapp/model/coffe_model.dart';
import 'package:flutter/material.dart';

class CoffeeProvider with ChangeNotifier {
  final List<Coffee> _coffeeList = [
    Coffee(name: 'Espresso', price: 2),
    Coffee(name: 'Latte', price: 3),
    Coffee(name: 'Cappuccino', price: 3),
    // Diğer kahve çeşitlerini buraya ekleyebilirsiniz
  ];
  String? _selectedCategory;
  String? get selectedCategory => _selectedCategory;
  List<Coffee> get coffeeList => _coffeeList;
  List<Coffee> get filteredCoffeeList {
    if (_selectedCategory == null) {
      return _coffeeList;
    }
    return _coffeeList
        .where((coffee) => coffee.name == _selectedCategory)
        .toList();
  }

  void selectCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  Coffee getCoffee(int index) {
    return _coffeeList[index];
  }
}
