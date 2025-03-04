import 'package:coffeapp/viewmodel/card_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChipWidget extends StatelessWidget {
  const ChipWidget({super.key, required this.label, required this.category});

  final String label;
  final String category;

  @override
  Widget build(BuildContext context) {
    final cardViewModel = Provider.of<CardViewModel>(context);

    return ChoiceChip(
      label: Text(label),
      selected: cardViewModel.selectedCategory ==
          category, // Seçili durumu kontrol et
      onSelected: (selected) {
        if (selected) {
          cardViewModel
              .updateSelectedCategory(category); // Seçili çipi güncelle
        }
      },
    );
  }
}
