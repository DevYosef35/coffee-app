import 'package:coffeapp/core/utility/constant/string_constant.dart';
import 'package:coffeapp/view/components/atoms/headline_small_text.dart';
import 'package:coffeapp/view/components/molecules/card_quantity_button.dart';
import 'package:coffeapp/view/components/molecules/order_price_detail.dart';
import 'package:coffeapp/viewmodel/card_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CardViewModel>(builder: (context, cardViewModel, child) {
      final selectedSize = cardViewModel.selectedCategory;
      final imgPath = cardViewModel.imgPath;
      final coffePrice = cardViewModel.coffeePrice;
      final coffeType = cardViewModel.coffeeType;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadlineSmallText(StringConstant.orderDetailText),
          Card(
            child: Dismissible(
              key: Key(coffeType.toString()),
              child: ListTile(
                leading: Image.asset(imgPath.toString()),
                title: Text(coffeType.toString()),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(selectedSize ?? "Küçük Boy"),
                    const CardQuantityButton()
                  ],
                ),
              ),
            ),
          ),
          const Divider(),
          OrderPriceDetails(
            coffePrice: coffePrice,
          ),
          const Divider(),
        ],
      );
    });
  }
}
