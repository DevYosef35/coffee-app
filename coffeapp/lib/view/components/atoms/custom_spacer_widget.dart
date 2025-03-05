import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomSpacer extends StatelessWidget {
  CustomSpacer({super.key, this.height});
  double? height = 38.0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
