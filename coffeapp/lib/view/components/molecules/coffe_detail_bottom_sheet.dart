import 'package:coffeapp/core/utility/constant/color_constant.dart';
import 'package:coffeapp/core/utility/constant/string_constant.dart';
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

    if (coffee == null) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Text("Seçili kahve bulunamadı"),
        ),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(coffee.image),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ProductNameWidget(text: coffee.name),
              Row(
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
                      backgroundColor:
                          WidgetStateProperty.all(ColorConstants.beige),
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
              ),
            ],
          ),
        )
      ],
    );
  }
}
