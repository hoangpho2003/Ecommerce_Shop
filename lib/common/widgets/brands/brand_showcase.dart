import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/RoundedContainer.dart';
import 'brand_card.dart';

class BrandShowcase extends StatelessWidget {
  const BrandShowcase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return HptRoundedContainer(
      showBorder: true,
      borderColor: HptColors.darkGrey,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: HptSizes.spaceBtwItems),
      child: Column(
        children: [
          /// Brand with product count
          const BrandCard(showBorder: false),
          const SizedBox(height: HptSizes.spaceBtwItems),

          /// Brand top 3 product image
          Row(children: images.map((image) => brandTopProductImageWidget(image, context)).toList())
        ],
      ),
    );
  }
}

Widget brandTopProductImageWidget(String image, context) {
  return Expanded(
    child: HptRoundedContainer(
      height: 100,
      backgroundColor: HptHelperFunctions.isDarkMode(context) ? HptColors.darkerGrey : HptColors.light,
      margin: const EdgeInsets.only(right: HptSizes.sm),
      padding: const EdgeInsets.all(HptSizes.md),
      child: Image(fit: BoxFit.contain, image: AssetImage(image)),
    ),
  );
}
