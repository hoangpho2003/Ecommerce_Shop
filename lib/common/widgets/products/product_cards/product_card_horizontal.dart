import 'package:ecommerce_hptshop/common/widgets/custom_shapes/containers/RoundedContainer.dart';
import 'package:ecommerce_hptshop/common/widgets/images/rounded_image.dart';
import 'package:ecommerce_hptshop/common/widgets/texts/BrandTitleWithVerifiedIcon.dart';
import 'package:ecommerce_hptshop/common/widgets/texts/product_price_text.dart';
import 'package:ecommerce_hptshop/common/widgets/texts/product_title_text.dart';
import 'package:ecommerce_hptshop/utils/constants/image_strings.dart';
import 'package:ecommerce_hptshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../icons/circular_icon.dart';

class HptProductCardHorizontal extends StatelessWidget {
  const HptProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HptHelperFunctions.isDarkMode(context);

    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(HptSizes.productImageRadius),
        color: dark ? HptColors.darkerGrey : HptColors.softGrey,
      ),
      child: Row(
        children: [
          /// Thumbnail
          HptRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(HptSizes.sm),
            backgroundColor: dark ? HptColors.dark : HptColors.light,
            child: Stack(
              children: [
                const SizedBox(
                  height: 120,
                  width: 120,
                  child: HptRoundedImage(imageUrl: HptImages.productImage3, applyImageRadius: true),
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
          ),

          /// Details
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: HptSizes.sm, left: HptSizes.sm),
              child: Column(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductTitleText(title: 'Green Nike Half Sleeves Shirt', smallSize: true),
                      SizedBox(height: HptSizes.spaceBtwItems / 2),
                      Brandtitlewithverifiedicon(title: 'Nike'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(child: ProductPriceText(price: '256.0')),

                      Container(
                        decoration: const BoxDecoration(
                          color: HptColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(HptSizes.cardRadiusMd),
                            bottomRight: Radius.circular(HptSizes.productImageRadius),
                          ),
                        ),
                        child: const SizedBox(
                          width: HptSizes.iconLg * 1.2,
                          height: HptSizes.iconLg * 1.2,
                          child: Center(child: Icon(Iconsax.add, color: HptColors.white)),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
