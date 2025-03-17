import 'package:coffeapp/core/utility/constant/padding_constant.dart';
import 'package:coffeapp/core/utility/constant/string_constant.dart';
import 'package:coffeapp/view/components/atoms/headline_small_text.dart';
import 'package:flutter/material.dart';

class OrderTypeToggle extends StatefulWidget {
  const OrderTypeToggle({
    super.key,
  });

  @override
  State<OrderTypeToggle> createState() => _OrderTypeToggleState();
}

class _OrderTypeToggleState extends State<OrderTypeToggle> {
  List<bool> isSlected = [true, false];
  // İlk buton seçili
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeadlineSmallText(StringConstant.orderTypeText),
        Center(
          child: ToggleButtons(
              isSelected: isSlected,
              onPressed: (int index) {
                setState(() {
                  for (int i = 0; i < isSlected.length; i++) {
                    isSlected[i] = i == index;
                  }
                });
              },
              children: [
                Padding(
                  padding: PaddingConstant.toggleButtonPadding,
                  child: Text(StringConstant.preOrderText),
                ),
                Padding(
                  padding: PaddingConstant.toggleButtonPadding,
                  child: Text(StringConstant.inPlaceOrderText),
                )
              ]),
        ),
        const Divider()
      ],
    );
  }
}
