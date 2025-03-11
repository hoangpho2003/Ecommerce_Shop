import 'package:ecommerce_hptshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../icons/circular_icon.dart';

class ProductAddRemove extends StatelessWidget {
  const ProductAddRemove({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HptHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: HptSizes.md,
          color: dark ? HptColors.white : HptColors.black,
          backgroundColor: dark ? HptColors.darkerGrey : HptColors.light,
        ),
        const SizedBox(width: HptSizes.spaceBtwItems),
        Text('2', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: HptSizes.spaceBtwItems),
        const CircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: HptSizes.md,
          color: HptColors.white,
          backgroundColor: HptColors.primary,
        ),
      ],
    );
  }
}
