// ignore_for_file: use_build_context_synchronously

import 'package:coffeapp/core/utility/utility.dart';
import 'package:coffeapp/model/coffe_model.dart';
import 'package:coffeapp/view/components/components.dart';
import 'package:coffeapp/viewmodel/coffe_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key, required this.coffee});
  final Coffee coffee;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(12),
            ),
            child: Image.asset(
              coffee.imgPath,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(coffee.name,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ColorConstants.darkBrown,
                      fontWeight: FontWeight.bold)),
              Text(coffee.price.toString(),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ColorConstants.darkBrown,
                      fontWeight: FontWeight.bold))
            ],
          ),
          Builder(
            builder: (buttonContext) => CardAddButton(
              onPress: () {
                Provider.of<CoffeeProvider>(buttonContext, listen: false)
                    .selectManualCoffee(coffee);
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  showModalBottomSheet(
                    useRootNavigator: true,
                    context: buttonContext,
                    builder: (context) {
                      return const CoffeDetailsBottomSheet();
                    },
                  );
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
