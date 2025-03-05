import 'package:coffeapp/viewmodel/card_view_model.dart';
import 'package:coffeapp/viewmodel/coffe_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChipWidget extends StatelessWidget {
  const ChipWidget({super.key, required this.label, required this.category});

  final String label;
  final String category;

  @override
  Widget build(BuildContext context) {
    final cardViewModel = Provider.of<CardViewModel>(context);
    final coffeSorting = Provider.of<CoffeeProvider>(context);
    final categories =
        coffeSorting.coffeeList.map((coffee) => coffee.name).toList();
    return ChoiceChip(
      label: Text(label),
      selected: coffeSorting.selectedCategory == category,
      onSelected: (isSelected) {
        if (isSelected) {
          coffeSorting.selectCategory(category);
        } else {
          coffeSorting.selectCategory("");
        }
      },
    );
  }
}
