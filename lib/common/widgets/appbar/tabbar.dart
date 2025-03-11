import 'package:ecommerce_hptshop/utils/constants/colors.dart';
import 'package:ecommerce_hptshop/utils/device/device_utility.dart';
import 'package:ecommerce_hptshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class HptTabBar extends StatelessWidget implements PreferredSizeWidget{
  const HptTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = HptHelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? HptColors.black : HptColors.white,
      child: TabBar(
          tabs: tabs,
          isScrollable: true,
          indicatorColor: HptColors.primary,
          labelColor: dark ? HptColors.white : HptColors.primary,
          unselectedLabelColor: HptColors.darkGrey,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(HptDeviceUtils.getAppBarHeight());
}
