import 'package:ecommerce_hptshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HptHelperFunctions.isDarkMode(context);
    return HptCurvedEdgeWidget(
      child: Container(
        color: dark ? HptColors.darkerGrey : HptColors.light,
        child: Stack(
          children: [
            /// Main Large Image
            const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(HptSizes.productImageRadius * 2),
                child: Center(child: Image(image: AssetImage(HptImages.productImage5))),
              ),
            ),

            Positioned(
              right: 0,
              bottom: 30,
              left: HptSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: 6,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => const SizedBox(width: HptSizes.spaceBtwItems),
                  itemBuilder: (_, index) => HptRoundedImage(
                    width: 80,
                    backgroundColor: dark ? HptColors.dark : HptColors.white,
                    border: Border.all(color: HptColors.primary),
                    padding: const EdgeInsets.all(HptSizes.sm),
                    imageUrl: HptImages.productImage6,
                  ),
                ),
              ),
            ),

            const HptAppBar(
              showBackArrow: true,
              actions: [CircularIcon(icon: Iconsax.heart5, color: Colors.red)],
            )
          ],
        ), // Padding
      ),
    );
  }
}
