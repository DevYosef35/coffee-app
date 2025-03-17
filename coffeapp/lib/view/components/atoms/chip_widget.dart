import 'package:coffeapp/model/coffe_type.dart';
import 'package:coffeapp/viewmodel/coffe_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardChipWidget extends StatelessWidget {
  const CardChipWidget({
    super.key,
    required this.type,
  });

  final CoffeeType type;

  @override
  Widget build(BuildContext context) {
    final coffeeProvider = Provider.of<CoffeeProvider>(context);
    return ChoiceChip(
      label: Text(_typeToText(type)),
      selected: coffeeProvider.selectedType == type,
      onSelected: (isSelected) {
        if (isSelected) {
          coffeeProvider.selectCategory(type);
        }
      },
    );
  }

  String _typeToText(CoffeeType type) {
    switch (type) {
      case CoffeeType.espresso:
        return "Espresso";
      case CoffeeType.latte:
        return "Latte";
      case CoffeeType.americano:
        return "Americano";
      case CoffeeType.cappuccino:
        return "Cappuccino";
      case CoffeeType.all:
        return "Hepsi";
    }
  }
}
