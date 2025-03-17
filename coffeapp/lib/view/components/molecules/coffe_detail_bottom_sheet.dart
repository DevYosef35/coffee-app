import 'package:auto_route/auto_route.dart';
import 'package:coffeapp/core/utility/utility.dart';
import 'package:coffeapp/view/components/components.dart';
import 'package:coffeapp/viewmodel/cart_view_model.dart';
import 'package:coffeapp/viewmodel/coffe_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoffeDetailsBottomSheet extends StatelessWidget {
  const CoffeDetailsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final coffeeModel = Provider.of<CoffeeProvider>(context);
    final coffee = coffeeModel.manuallySelectedCoffee;

    if (coffee == null) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Text("Seçili kahve bulunamadı"),
        ),
      );
    }

    return Column(
      children: [
        Image.asset(coffee.imgPath),
        Text(
          coffee.name,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: ColorConstants.darkBrown,
                fontWeight: FontWeight.w700,
              ),
        ),
        Wrap(
          spacing: 8.0,
          children: coffeeModel.coffeeSize.map((category) {
            final isSelected = coffeeModel.selectedSize == category;
            return ChoiceChip(
              label: Text(category),
              selected: isSelected,
              onSelected: (selected) {
                if (selected) {
                  coffeeModel.selectSize(category);
                }
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () async {
                context.read<CartViewModel>().addToCart(coffee);
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Sipariş Verildi")));
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
            CardQuantityButton(
              coffeeName: coffee.name,
            )
          ],
        )
      ],
    );
  }
}
