import 'package:coffeapp/viewmodel/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/utility/utility.dart';
import '../atoms/atomic_widgets.dart';
import '../molecules/molecules_widgets.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final coffeeList = Provider.of<CartViewModel>(context).cart;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeadlineSmallText(StringConstant.orderDetailText),
        Flexible(
          fit: FlexFit.loose,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: coffeeList.length,
            itemBuilder: (BuildContext context, int index) {
              final coffee = coffeeList[index];
              return Card(
                elevation: 4,
                child: Dismissible(
                  key: Key(coffee.name),
                  child: ListTile(
                    leading: Image.asset(coffee.imgPath),
                    title: Text(coffee.name),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(coffee.size),
                        CardQuantityButton(coffeeName: coffee.name)
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const Divider(),
        const OrderPriceDetails(),
        const Divider(),
      ],
    );
  }
}
