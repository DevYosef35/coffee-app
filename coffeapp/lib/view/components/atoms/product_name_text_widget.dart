import 'package:coffeapp/core/utility/constant/constant.dart';
import 'package:flutter/material.dart';

class ProductNameWidget extends StatelessWidget {
  const ProductNameWidget({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: ColorConstants.darkBrown, fontWeight: FontWeight.bold));
  }
}
