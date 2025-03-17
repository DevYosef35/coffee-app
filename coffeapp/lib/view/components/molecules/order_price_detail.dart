import 'package:coffeapp/core/utility/constant/constant.dart';
import 'package:coffeapp/view/components/components.dart';
import 'package:coffeapp/viewmodel/card_quantity_view_model.dart';
import 'package:coffeapp/viewmodel/coffe_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderPriceDetails extends StatelessWidget {
  const OrderPriceDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final coffee = Provider.of<CoffeeProvider>(context).manuallySelectedCoffee;
    final coffeeName = coffee?.name;
    final quantity =
        Provider.of<CardQuantityViewModel>(context).getQuantity(coffeeName!);

    if (coffee == null) {
      return const SizedBox.shrink();
    }

    final coffeePrice = coffee.price;
    final totalPrice = coffeePrice * quantity;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeadlineSmallText(StringConstant.orderAmountText),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(StringConstant.totalAmountText),
            Text(totalPrice.toString())
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(StringConstant.extrasText),
            Text(coffeePrice.toString())
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(StringConstant.taxesText),
            Text((coffeePrice * 0.2).toString())
          ],
        ),
      ],
    );
  }
}
