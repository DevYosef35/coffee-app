import 'package:coffeapp/core/utility/constant/color_constant.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static EdgeInsets getSafePadding(BuildContext context) {
    return EdgeInsets.only(top: MediaQuery.of(context).padding.top);
  }

  ThemeData themeData = ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: ColorConstants.beige,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        ),
      ),
      cardTheme: const CardTheme(
        elevation: 4,
        color: ColorConstants.offWhite,
      ),
      toggleButtonsTheme: ToggleButtonsThemeData(
        borderRadius: BorderRadius.circular(12),
        borderColor: ColorConstants.beige,
        selectedBorderColor: ColorConstants.beige,
        fillColor: ColorConstants.beige,
        color: ColorConstants.beige,
        selectedColor: Colors.white,
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
