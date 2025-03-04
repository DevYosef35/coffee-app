import 'package:coffeapp/core/utility/constant/color_constant.dart';
import 'package:coffeapp/core/utility/constant/string_constant.dart';
import 'package:coffeapp/view/components/atoms/chip_widget.dart';
import 'package:coffeapp/view/components/molecules/card_quantity_button.dart';
import 'package:coffeapp/view/shopping_cart_view.dart';
import 'package:coffeapp/viewmodel/card_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoffeDetailsBottomSheet extends StatelessWidget {
  final String coffeType;
  final String imgCoffe;

  const CoffeDetailsBottomSheet({
    required this.coffeType,
    required this.imgCoffe,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CardViewModel>(context, listen: false);

    return Column(
      children: [
        Image.asset(imgCoffe),
        Text(
          coffeType,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: ColorConstants.darkBrown,
                fontWeight: FontWeight.w700,
              ),
        ),
        Wrap(
          spacing: 8.0,
          children: viewModel.categories.map((category) {
            return ChipWidget(label: category, category: category);
          }).toList(),
        ),
        const SizedBox(height: 16),
        const _BottomSheetActions(),
      ],
    );
  }
}

class _BottomSheetActions extends StatelessWidget {
  const _BottomSheetActions();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ShoppingCartView()));
          },
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(const Size(217, 55)),
            backgroundColor: MaterialStateProperty.all(ColorConstants.beige),
          ),
          child: Text(
            StringConstant.takeOrderText,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.white),
          ),
        ),
        const CardQuantityButton()
      ],
    );
  }
}
