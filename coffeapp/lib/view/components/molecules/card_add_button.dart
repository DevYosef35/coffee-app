import 'package:coffeapp/core/utility/constant/color_constant.dart';
import 'package:coffeapp/core/utility/constant/string_constant.dart';
import 'package:flutter/material.dart';

class CardAddButton extends StatelessWidget {
  const CardAddButton({super.key, required this.onPress});
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(ColorConstants.darkBrown),
        minimumSize: WidgetStateProperty.all(const Size(100, 40)),
      ),
      child: Text(
        StringConstant.buttonText,
        style: Theme.of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(color: Colors.white),
      ),
    );
  }
}
