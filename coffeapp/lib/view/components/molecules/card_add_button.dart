import 'package:coffeapp/core/utility/constant/color_constant.dart';
import 'package:coffeapp/core/utility/constant/string_constant.dart';
import 'package:flutter/material.dart';

class CardAddButton extends StatefulWidget {
  const CardAddButton({super.key, required this.onPress});
  final void Function(BuildContext)? onPress; // Context alması gerekiyor

  @override
  State<CardAddButton> createState() => _CardAddButtonState();
}

class _CardAddButtonState extends State<CardAddButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        widget.onPress!(context);
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(ColorConstants.darkBrown),
        minimumSize: MaterialStateProperty.all(const Size(100, 40)),
      ),
      child: Text(StringConstant.buttonText,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: Colors.white)),
    );
  }
}
