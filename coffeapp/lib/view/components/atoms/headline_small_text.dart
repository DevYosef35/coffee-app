import 'package:coffeapp/core/utility/constant/color_constant.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HeadlineSmallText extends StatelessWidget {
  HeadlineSmallText(this.text, {super.key});
  String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
          color: ColorConstants.darkBrown, fontWeight: FontWeight.w500),
    );
  }
}
