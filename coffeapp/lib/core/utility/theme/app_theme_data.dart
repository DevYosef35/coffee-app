import 'package:coffeapp/core/utility/constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppTheme {
  static EdgeInsets getSafePadding(BuildContext context) {
    return EdgeInsets.only(top: MediaQuery.of(context).padding.top);
  }

  ThemeData themeData = ThemeData(
      cardTheme: const CardTheme(
        color: ColorConstants.offWhite,
      ),
      chipTheme: const ChipThemeData(
          side: BorderSide(color: ColorConstants.beige),
          showCheckmark: false,
          backgroundColor: Colors.transparent,
          selectedColor: ColorConstants.beige,
          labelStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: ColorConstants.beige),
          secondaryLabelStyle: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white),
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24)));
}
