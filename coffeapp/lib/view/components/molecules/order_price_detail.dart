import 'package:coffeapp/core/utility/constant/constant.dart';
import 'package:coffeapp/view/components/components.dart';
import 'package:flutter/material.dart';

class OrderPriceDetails extends StatelessWidget {
  final int? coffePrice;

  const OrderPriceDetails({required this.coffePrice, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeadlineSmallText(StringConstant.orderAmountText),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(StringConstant.totalAmountText),
            Text(coffePrice.toString())
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(StringConstant.extrasText),
            Text(coffePrice.toString())
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(StringConstant.taxesText),
            Text((coffePrice! * 0.2).toString())
          ],
        ),
      ],
    );
  }
}
