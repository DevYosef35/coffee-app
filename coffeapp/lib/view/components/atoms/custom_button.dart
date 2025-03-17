import 'package:coffeapp/core/utility/constant/color_constant.dart';

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {required this.navigatorWidget, super.key, required this.buttonText});

  final VoidCallback navigatorWidget;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(const Size(280, 48)),
        backgroundColor: WidgetStateProperty.all(ColorConstants.darkBrown),
      ),
      onPressed: navigatorWidget,
      child: Text(
        buttonText,
        style: Theme.of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(color: Colors.white, fontWeight: FontWeight.w800),
      ),
    );
  }
}
