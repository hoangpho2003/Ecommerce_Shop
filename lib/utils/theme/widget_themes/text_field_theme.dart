import 'package:flutter/material.dart';
import 'package:ecommerce_hptshop/utils/constants/colors.dart';
import '../../constants/sizes.dart';

class HptTextFormFieldTheme {
  HptTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: HptColors.darkGrey,
    suffixIconColor: HptColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: HptSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(fontSize: HptSizes.fontSizeMd, color: HptColors.black),
    hintStyle: const TextStyle().copyWith(fontSize: HptSizes.fontSizeSm, color: HptColors.black),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: HptColors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(HptSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: HptColors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(HptSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: HptColors.grey),
    ),
    focusedBorder:const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(HptSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: HptColors.dark),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(HptSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: HptColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(HptSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: HptColors.warning),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: HptColors.darkGrey,
    suffixIconColor: HptColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: HptSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(fontSize: HptSizes.fontSizeMd, color: HptColors.white),
    hintStyle: const TextStyle().copyWith(fontSize: HptSizes.fontSizeSm, color: HptColors.white),
    floatingLabelStyle: const TextStyle().copyWith(color: HptColors.white.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(HptSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: HptColors.darkGrey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(HptSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: HptColors.darkGrey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(HptSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: HptColors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(HptSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: HptColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(HptSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: HptColors.warning),
    ),
  );
}
