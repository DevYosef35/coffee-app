// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/card_view_model.dart'; // CardViewModel'i içe aktar

class ShoppingCartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Siparişleriniz"),
      ),
      body: Consumer<CardViewModel>(
        builder: (context, cardViewModel, child) {
          final selectedSize = cardViewModel.selectedCategory;
          final imgPath = cardViewModel.imgPath;
          final coffePrice = cardViewModel.coffeePrice;
          final coffeType = cardViewModel.coffeeType;
          return ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    child: ListTile(
                      leading: Image.asset(imgPath.toString()),
                      title: Text(coffeType.toString()),
                      subtitle: Row(
                        children: [
                          Text(selectedSize ?? ""),
                          Text(coffePrice.toString())
                        ],
                      ),
                      trailing: IconButton(
                          onPressed: () {}, icon: const Icon(Icons.remove)),
                    ),
                  )
                ],
              );
            },
          );
        },
      ),
    );
  }
}
