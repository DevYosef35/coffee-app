import 'package:coffeapp/core/utility/constant/color_constant.dart';

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {required this.navigatorWidget, super.key, required this.buttonText});
  final Widget navigatorWidget;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(const Size(280, 48)),
            backgroundColor:
                MaterialStateProperty.all(ColorConstants.darkBrown)),
        onPressed: () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => navigatorWidget),
              (route) => false);
        },
        child: Text(
          buttonText,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: Colors.white, fontWeight: FontWeight.w800),
        ));
  }
}
