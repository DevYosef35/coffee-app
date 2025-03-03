// ignore_for_file: use_build_context_synchronously

import 'package:coffeapp/core/utility/constant/color_constant.dart';
import 'package:coffeapp/view/components/molecules/card_add_button.dart';
import 'package:coffeapp/view/components/molecules/coffe_detail_bottom_sheet.dart';
import 'package:coffeapp/viewmodel/card_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.coffeName,
    required this.coffePrice,
    required this.imgPath,
  });

  final String coffeName;
  final String imgPath;
  final int coffePrice;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CardViewModel>(
      create: (_) => CardViewModel(),
      child: _CardWidgetBody(
        coffeName: coffeName,
        coffePrice: coffePrice,
        imgPath: imgPath,
      ),
    );
  }
}

class _CardWidgetBody extends StatelessWidget {
  const _CardWidgetBody({
    required this.coffeName,
    required this.coffePrice,
    required this.imgPath,
  });

  final String coffeName;
  final int coffePrice;
  final String imgPath;

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final viewModel = Provider.of<CardViewModel>(context);

    return Card(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(12),
            ),
            child: Image.asset(
              imgPath,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(coffeName,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ColorConstants.darkBrown,
                      fontWeight: FontWeight.bold)),
              Text(coffePrice.toString(),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ColorConstants.darkBrown,
                      fontWeight: FontWeight.bold))
            ],
          ),
          CardAddButton(onPress: (BuildContext context) {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return CoffeDetailsBottomSheet(
                    coffeType: coffeName, imgCoffe: imgPath);
              },
            );
          })
        ],
      ),
    );
  }
}
