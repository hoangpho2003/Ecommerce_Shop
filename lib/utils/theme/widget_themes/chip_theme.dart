import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class HptChipTheme {
  HptChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: HptColors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: HptColors.black),
    selectedColor: HptColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: HptColors.white,
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: HptColors.darkerGrey,
    labelStyle: TextStyle(color: HptColors.white),
    selectedColor: HptColors.primary,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: HptColors.white,
  );
}
