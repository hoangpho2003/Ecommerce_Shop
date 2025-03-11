import 'package:ecommerce_hptshop/common/widgets/custom_shapes/containers/RoundedContainer.dart';
import 'package:ecommerce_hptshop/common/widgets/images/circular_image.dart';
import 'package:ecommerce_hptshop/common/widgets/texts/BrandTitleWithVerifiedIcon.dart';
import 'package:ecommerce_hptshop/common/widgets/texts/product_price_text.dart';
import 'package:ecommerce_hptshop/common/widgets/texts/product_title_text.dart';
import 'package:ecommerce_hptshop/utils/constants/colors.dart';
import 'package:ecommerce_hptshop/utils/constants/enums.dart';
import 'package:ecommerce_hptshop/utils/constants/image_strings.dart';
import 'package:ecommerce_hptshop/utils/constants/sizes.dart';
import 'package:ecommerce_hptshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HptHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            HptRoundedContainer(
              radius: HptSizes.sm,
              backgroundColor: HptColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(horizontal: HptSizes.sm, vertical: HptSizes.xs),
              child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: HptColors.black)),
            ),
            const SizedBox(width: HptSizes.spaceBtwItems),
            Text('\$250', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
            const SizedBox(width: HptSizes.spaceBtwItems),
            const ProductPriceText(price: '175', isLarge: true),
          ],
        ),
        const SizedBox(width: HptSizes.spaceBtwItems / 1.5),
        const ProductTitleText(title: 'Green Nike Sport Shirt'),
        const SizedBox(width: HptSizes.spaceBtwItems / 1.5),
        Row(
          children: [
            const ProductTitleText(title: 'Status'),
            const SizedBox(width: HptSizes.spaceBtwItems),
            Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(width: HptSizes.spaceBtwItems / 1.5),
        Row(
          children: [
            CircularImage(image: HptImages.shoeIcon, width: 32, height: 32, overlayColor: dark ? HptColors.white : HptColors.black),
            const Brandtitlewithverifiedicon(title: 'Nike', brandTextSize: TextSizes.medium),
          ],
        )
      ],
    );
  }
}
