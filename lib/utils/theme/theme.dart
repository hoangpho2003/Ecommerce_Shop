import 'package:flutter/material.dart';
import 'package:ecommerce_hptshop/utils/theme/widget_themes/appbar_theme.dart';
import 'package:ecommerce_hptshop/utils/theme/widget_themes/bottom_sheet_theme.dart';
import 'package:ecommerce_hptshop/utils/theme/widget_themes/checkbox_theme.dart';
import 'package:ecommerce_hptshop/utils/theme/widget_themes/chip_theme.dart';
import 'package:ecommerce_hptshop/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:ecommerce_hptshop/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:ecommerce_hptshop/utils/theme/widget_themes/text_field_theme.dart';
import 'package:ecommerce_hptshop/utils/theme/widget_themes/text_theme.dart';
import '../constants/colors.dart';

class HptAppTheme {
  HptAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: HptColors.grey,
    brightness: Brightness.light,
    primaryColor: HptColors.primary,
    textTheme: HptTextTheme.lightTextTheme,
    chipTheme: HptChipTheme.lightChipTheme,
    scaffoldBackgroundColor: HptColors.white,
    appBarTheme: HptAppBarTheme.lightAppBarTheme,
    checkboxTheme: HptCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: HptBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: HptElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: HptOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: HptTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: HptColors.grey,
    brightness: Brightness.dark,
    primaryColor: HptColors.primary,
    textTheme: HptTextTheme.darkTextTheme,
    chipTheme: HptChipTheme.darkChipTheme,
    scaffoldBackgroundColor: HptColors.black,
    appBarTheme: HptAppBarTheme.darkAppBarTheme,
    checkboxTheme: HptCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: HptBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: HptElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: HptOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: HptTextFormFieldTheme.darkInputDecorationTheme,
  );
}
