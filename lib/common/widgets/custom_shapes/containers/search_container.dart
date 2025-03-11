import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_functions.dart';

class HptSearchContainer extends StatelessWidget {
  const HptSearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: HptSizes.defaultSpace),
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final dark = HptHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: HptDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(HptSizes.md),
          decoration: BoxDecoration(
            color: showBackground
                ? dark
                    ? HptColors.dark
                    : HptColors.light
                : Colors.transparent,
            borderRadius: BorderRadius.circular(HptSizes.cardRadiusLg),
            border: showBorder ? Border.all(color: HptColors.grey) : null,
          ),
          child: Row(
            children: [Icon(icon, color: HptColors.darkGrey), const SizedBox(width: HptSizes.spaceBtwItems), Text(text, style: Theme.of(context).textTheme.bodySmall)],
          ),
        ),
      ),
    );
  }
}
