import 'package:coffeapp/model/coffe_model.dart';
import 'package:coffeapp/model/coffe_type.dart';
import 'package:flutter/material.dart';

class CoffeeProvider with ChangeNotifier {
  CoffeeType selectedType = CoffeeType.all;

  final List<String> _coffeeCategories = [
    "Hepsi",
    "Latte",
    "Americano",
    "Mocha"
  ];
  final List<String> _coffeeSize = ["Küçük", "Orta", "Büyük"];

  final List<Coffee> _coffeeList = [
    Coffee(
        type: CoffeeType.espresso,
        name: 'Espresso',
        price: 2,
        imgPath: "assets/espresso_coffe_cup.jpg",
        size: ""),
    Coffee(
        type: CoffeeType.latte,
        name: 'Latte',
        price: 3,
        imgPath: "assets/latte_coffe_cup.jpg",
        size: ""),
    Coffee(
        type: CoffeeType.cappuccino,
        name: 'Cappuccino',
        price: 3,
        imgPath: "assets/cappuccino_coffe_cup.jpg",
        size: ""),
    Coffee(
        type: CoffeeType.americano,
        name: 'Americano',
        price: 3,
        imgPath: "assets/americano_coffe_cup.jpg",
        size: ""),
  ];

  Coffee? _manuallySelectedCoffee;
  Coffee? get manuallySelectedCoffee => _manuallySelectedCoffee;

  void selectManualCoffee(Coffee coffee) {
    _manuallySelectedCoffee = coffee;
    notifyListeners();
  }

  void clearManualCoffee() {
    _manuallySelectedCoffee = null;
    notifyListeners();
  }

  List<Coffee> get filteredCoffees {
    if (selectedType == CoffeeType.all) {
      return _coffeeList;
    }
    return _coffeeList.where((coffee) => coffee.type == selectedType).toList();
  }

  Coffee? get selectedCoffee {
    if (selectedType == CoffeeType.all) return null;

    try {
      return _coffeeList.firstWhere(
        (coffee) => coffee.type == selectedType,
      );
    } catch (_) {
      return null;
    }
  }

  String get selectedCoffeeName => selectedCoffee?.name ?? 'Kahve Adı Yok';
  String get selectedCoffeeImage =>
      selectedCoffee?.imgPath ?? 'assets/default.jpg';

  List<String> get coffeeSize => _coffeeSize;
  List<String> get coffeeCategories => _coffeeCategories;
  List<Coffee> get coffeeList => _coffeeList;

  String? _selectedSize;
  String? get selectedSize => _selectedSize;

  int? _selectedPrice;
  int? get selectedPrice => _selectedPrice;

  void selectCategory(CoffeeType category) {
    selectedType = category;
    notifyListeners();
  }

  Coffee getCoffee(int index) {
    return filteredCoffees[index];
  }

  void selectSize(String size) {
    _selectedSize = size;
    notifyListeners();
  }

  void selectPrice(int price) {
    _selectedPrice = price;
    notifyListeners();
  }
}
