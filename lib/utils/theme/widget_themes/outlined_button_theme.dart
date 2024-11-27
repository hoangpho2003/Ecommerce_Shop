import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';

/* -- Light & Dark Outlined Button Themes -- */
class HptOutlinedButtonTheme {
  HptOutlinedButtonTheme._(); //To avoid creating instances


  /* -- Light Theme -- */
  static final lightOutlinedButtonTheme  = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: HptColors.dark,
      side: const BorderSide(color: HptColors.borderPrimary),
      textStyle: const TextStyle(fontSize: 16, color: HptColors.black, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: HptSizes.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(HptSizes.buttonRadius)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: HptColors.light,
      side: const BorderSide(color: HptColors.borderPrimary),
      textStyle: const TextStyle(fontSize: 16, color: HptColors.textWhite, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: HptSizes.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(HptSizes.buttonRadius)),
    ),
  );
}
