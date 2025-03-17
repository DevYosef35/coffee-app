import 'package:coffeapp/core/utility/constant/constant.dart'
    show PaddingConstant;
import 'package:coffeapp/model/coffe_type.dart' show CoffeeType;
import 'package:coffeapp/viewmodel/coffe_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FiltrationsButtons extends StatelessWidget {
  const FiltrationsButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CoffeeProvider>(context);

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.07,
      child: ListView.separated(
        padding: PaddingConstant.chipSpacing,
        scrollDirection: Axis.horizontal,
        itemCount: CoffeeType.values.length,
        separatorBuilder: (context, index) => const SizedBox(width: 8.0),
        itemBuilder: (BuildContext context, int index) {
          final type = CoffeeType.values[index];
          return ChoiceChip(
            label: Text(_typeToText(type)),
            selected: provider.selectedType == type,
            onSelected: (isSelected) {
              if (isSelected) {
                provider.selectCategory(type);
              }
            },
          );
        },
      ),
    );
  }
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
