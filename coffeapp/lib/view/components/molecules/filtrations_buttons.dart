import 'package:coffeapp/core/extension/string_extension.dart';
import 'package:coffeapp/core/utility/constant/constant.dart'
    show PaddingConstant;
import 'package:coffeapp/viewmodel/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FiltrationsButtons extends StatelessWidget {
  const FiltrationsButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);
    final categories = provider.categories; // List<String>

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.07,
      child: ListView.separated(
        padding: PaddingConstant.chipSpacing,
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (context, index) => const SizedBox(width: 8.0),
        itemBuilder: (BuildContext context, int index) {
          final categoryId = categories[index];
          final isSelected = provider.selectedCategory == categoryId;

          return ChoiceChip(
            label: Text(
              categoryId == 'all' ? 'Tümü' : categoryId.capitalize(),
            ),
            selected: isSelected,
            onSelected: (_) {
              provider.selectCategory(categoryId);
            },
          );
        },
      ),
    );
  }
}
