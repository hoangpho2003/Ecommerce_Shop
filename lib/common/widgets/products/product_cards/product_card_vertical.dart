import 'package:ecommerce_hptshop/common/styles/shadows.dart';
import 'package:ecommerce_hptshop/common/widgets/custom_shapes/containers/RoundedContainer.dart';
import 'package:ecommerce_hptshop/common/widgets/images/rounded_image.dart';
import 'package:ecommerce_hptshop/utils/constants/colors.dart';
import 'package:ecommerce_hptshop/utils/constants/image_strings.dart';
import 'package:ecommerce_hptshop/utils/constants/sizes.dart';
import 'package:ecommerce_hptshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../icons/circular_icon.dart';

class HptProductCardVertical extends StatelessWidget {
  const HptProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HptHelperFunctions.isDarkMode(context);

    return Container(
      width: 180,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        boxShadow: [ShadowStyle.verticalProductShadow],
        borderRadius: BorderRadius.circular(HptSizes.productImageRadius),
        color: dark ? HptColors.darkerGrey : HptColors.white,
      ),
      child: Column(
        children: [
          HptRoundedContainer(
            height: 180,
            padding: const EdgeInsets.all(HptSizes.sm),
            backgroundColor: dark ? HptColors.dark : HptColors.light,
            child: Stack(
              children: [
                /// Thumbnail Image
                const HptRoundedImage(
                  imageUrl: HptImages.productImage1,
                  applyImageRadius: true,
                ),

                /// Sale Tag
                Positioned(
                  top: 12,
                  child: HptRoundedContainer(
                    radius: HptSizes.sm,
                    backgroundColor: HptColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(horizontal: HptSizes.sm, vertical: HptSizes.xs),
                    child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: HptColors.black)),
                  ),
                ),

                /// Favourite Icon
                const Positioned(
                  top: 0,
                  right: 0,
                  child: CircularIcon(icon: Iconsax.heart5, color: Colors.red),
                ),
              ],
            ),
          )

          /// Details

        ],
      ),
    );
  }
}
