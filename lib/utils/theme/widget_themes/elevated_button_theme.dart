import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

/* -- Light & Dark Elevated Button Themes -- */
class HptElevatedButtonTheme {
  HptElevatedButtonTheme._(); //To avoid creating instances


  /* -- Light Theme -- */
  static final lightElevatedButtonTheme  = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: HptColors.light,
      backgroundColor: HptColors.primary,
      disabledForegroundColor: HptColors.darkGrey,
      disabledBackgroundColor: HptColors.buttonDisabled,
      side: const BorderSide(color: HptColors.primary),
      padding: const EdgeInsets.symmetric(vertical: HptSizes.buttonHeight),
      textStyle: const TextStyle(fontSize: 16, color: HptColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(HptSizes.buttonRadius)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: HptColors.light,
      backgroundColor: HptColors.primary,
      disabledForegroundColor: HptColors.darkGrey,
      disabledBackgroundColor: HptColors.darkerGrey,
      side: const BorderSide(color: HptColors.primary),
      padding: const EdgeInsets.symmetric(vertical: HptSizes.buttonHeight),
      textStyle: const TextStyle(fontSize: 16, color: HptColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(HptSizes.buttonRadius)),
    ),
  );
}
