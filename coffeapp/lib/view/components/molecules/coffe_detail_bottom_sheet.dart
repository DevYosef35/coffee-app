import 'package:coffeapp/core/utility/constant/color_constant.dart';
import 'package:coffeapp/core/utility/constant/string_constant.dart';
import 'package:coffeapp/model/product_model.dart';
import 'package:coffeapp/view/components/atoms/product_name_text_widget.dart';
import 'package:coffeapp/view/components/molecules/card_quantity_button.dart';
import 'package:coffeapp/viewmodel/cart_view_model.dart';
import 'package:coffeapp/viewmodel/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:auto_route/auto_route.dart';

class CoffeDetailsBottomSheet extends StatelessWidget {
  const CoffeDetailsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final coffee = productProvider.selectedProduct;
    final sizes = coffee!.sizes.entries.toList();

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(coffee.image),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ProductNameWidget(text: coffee.name),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  children: sizes
                      .map((entry) => SizeSelector(
                            sizeName: entry.key,
                            isSelected:
                                productProvider.selectedSize == entry.key,
                            onTap: () => productProvider.selectSize(entry.key),
                          ))
                      .toList(),
                ),
                const SizedBox(height: 16),
                AddItemWidget(coffee: coffee),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SizeSelector extends StatelessWidget {
  const SizeSelector({
    super.key,
    required this.sizeName,
    required this.isSelected,
    required this.onTap,
  });

  final String sizeName;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: ButtonStyle(
        side: WidgetStateProperty.all(
          BorderSide(
            color: ColorConstants.beige,
          ),
        ),
        backgroundColor: WidgetStateProperty.all(
          isSelected ? ColorConstants.beige : Colors.transparent,
        ),
        foregroundColor: WidgetStateProperty.all(
          isSelected ? Colors.white : ColorConstants.beige,
        ),
      ),
      child: Text(sizeName),
    );
  }
}

class AddItemWidget extends StatelessWidget {
  const AddItemWidget({
    super.key,
    required this.coffee,
  });

  final ProductModel coffee;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          onPressed: () async {
            context.read<CartViewModel>().addToCart(coffee);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Sipariş Verildi")),
            );
            context.router.maybePop();
          },
          style: ButtonStyle(
            minimumSize: WidgetStateProperty.all(const Size(217, 55)),
            backgroundColor: WidgetStateProperty.all(ColorConstants.beige),
          ),
          child: Text(
            StringConstant.takeOrderText,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.white),
          ),
        ),
        CartQuantityButton(
          item: coffee,
        )
      ],
    );
  }
}
