import 'package:coffeapp/viewmodel/card_quantity_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardQuantityButton extends StatelessWidget {
  final String coffeeName;
  const CardQuantityButton({super.key, required this.coffeeName});

  @override
  Widget build(BuildContext context) {
    final quantityProvider = Provider.of<CardQuantityViewModel>(context);
    final quantity = quantityProvider.getQuantity(coffeeName);

    return Row(
      children: [
        IconButton(
          onPressed: () => quantityProvider.decrement(coffeeName),
          icon: const Icon(Icons.remove),
        ),
        Text(quantity.toString()),
        IconButton(
          onPressed: () => quantityProvider.increment(coffeeName),
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
