// ignore_for_file: use_build_context_synchronously

import 'package:coffeapp/core/utility/constant/constant.dart';
import 'package:coffeapp/model/product_model.dart';
import 'package:coffeapp/view/components/atoms/product_name_text_widget.dart';
import 'package:coffeapp/view/components/components.dart';
import 'package:coffeapp/viewmodel/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(12),
            ),
            child: Image.asset(
              product.image,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ProductNameWidget(text: product.name),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ProductNameWidget(
                text: '${product.basePrice} TL',
              ),
              Builder(
                builder: (buttonContext) => IconButton(
                  onPressed: () {
                    Provider.of<ProductProvider>(buttonContext, listen: false)
                        .selectProduct(product);
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
                  icon: const Icon(
                    Icons.add_shopping_cart,
                    color: ColorConstants.darkBrown,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
