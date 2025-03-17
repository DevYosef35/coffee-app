import 'package:coffeapp/core/utility/utility.dart';
import 'package:flutter/material.dart';

class EmptyCartView extends StatelessWidget {
  const EmptyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_cart,
              size: 64,
              color: ColorConstants.darkBrown,
            ),
            Text("Sepetiniz Boş")
          ],
        ),
      ),
    );
  }
}
