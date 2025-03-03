import 'package:coffeapp/viewmodel/card_quantity_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardQuantityButton extends StatelessWidget {
  const CardQuantityButton({super.key});

  @override
  Widget build(BuildContext context) {
    final quantityProvider = Provider.of<CardQuantityViewModel>(context);

    return Row(
      children: [
        IconButton(
          onPressed: quantityProvider.decrement,
          icon: const Icon(Icons.remove),
        ),
        Text(quantityProvider.quantity.toString()),
        IconButton(
          onPressed: quantityProvider.increment,
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
