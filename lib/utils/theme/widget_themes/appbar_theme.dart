import 'package:flutter/material.dart';
import 'package:ecommerce_hptshop/utils/constants/sizes.dart';
import '../../constants/colors.dart';

class HptAppBarTheme{
  HptAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: HptColors.black, size: HptSizes.iconMd),
    actionsIconTheme: IconThemeData(color: HptColors.black, size: HptSizes.iconMd),
    titleTextStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: HptColors.black),
  );
  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: HptColors.black, size: HptSizes.iconMd),
    actionsIconTheme: IconThemeData(color: HptColors.white, size: HptSizes.iconMd),
    titleTextStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: HptColors.white),
  );
}