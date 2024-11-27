import 'package:ecommerce_hptshop/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/sizes.dart';

class HptAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HptAppBar({super.key, this.title, this.showBackArrow = false, this.lendingIcon, this.actions, this.lendingOnPressed});

  final Widget? title;
  final bool showBackArrow;
  final IconData? lendingIcon;
  final List<Widget>? actions;
  final VoidCallback? lendingOnPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: HptSizes.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ? IconButton(onPressed: () => Get.back(), icon: const Icon(Iconsax.arrow_left))
            : lendingIcon != null
                ? IconButton(onPressed: lendingOnPressed, icon: Icon(lendingIcon))
                : null,
        title: title,
        actions: actions,
      ),
    );
  }

  @override // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(HptDeviceUtils.getAppBarHeight());
}
