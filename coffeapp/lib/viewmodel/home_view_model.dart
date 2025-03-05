import 'package:coffeapp/view/home_view.dart';
import 'package:flutter/material.dart';

mixin HomeViewModel on State<HomeView> {
  final List<String> categories = ["Hepsi", "Latte", "Americano", "Mocha"];
  String selectedCategory = "Hepsi";
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
