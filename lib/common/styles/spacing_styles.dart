import 'package:flutter/material.dart';

import '../../utils/constants/sizes.dart';

class HptSpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: HptSizes.appBarHeight,
    left: HptSizes.defaultSpace,
    bottom: HptSizes.defaultSpace,
    right: HptSizes.defaultSpace,
  );
}
