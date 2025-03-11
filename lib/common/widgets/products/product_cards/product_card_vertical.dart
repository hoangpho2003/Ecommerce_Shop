import 'package:ecommerce_hptshop/common/styles/shadows.dart';
import 'package:ecommerce_hptshop/common/widgets/custom_shapes/containers/RoundedContainer.dart';
import 'package:ecommerce_hptshop/common/widgets/images/rounded_image.dart';
import 'package:ecommerce_hptshop/common/widgets/texts/BrandTitleWithVerifiedIcon.dart';
import 'package:ecommerce_hptshop/common/widgets/texts/product_title_text.dart';
import 'package:ecommerce_hptshop/features/shop/controllers/product_controller.dart';
import 'package:ecommerce_hptshop/features/shop/screens/product_details/product_detail.dart';
import 'package:ecommerce_hptshop/utils/constants/colors.dart';
import 'package:ecommerce_hptshop/utils/constants/enums.dart';
import 'package:ecommerce_hptshop/utils/constants/sizes.dart';
import 'package:ecommerce_hptshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../features/shop/models/product_model.dart';
import '../../icons/circular_icon.dart';
import '../../texts/product_price_text.dart';

class HptProductCardVertical extends StatelessWidget {
  const HptProductCardVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = HptHelperFunctions.isDarkMode(context);
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);

    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(productModel: product)),
      child: Container(
        width: 180,
        height: 180,
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
                  Center(
                    child: HptRoundedImage(
                      imageUrl: product.thumbnail,
                      applyImageRadius: true,
                    ),
                  ),

                  /// Sale Tag
                  Positioned(
                    top: 12,
                    child: HptRoundedContainer(
                      radius: HptSizes.sm,
                      backgroundColor: HptColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(horizontal: HptSizes.sm, vertical: HptSizes.xs),
                      child: Text('$salePercentage%', style: Theme.of(context).textTheme.labelLarge!.apply(color: HptColors.black)),
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
            const SizedBox(height: HptSizes.spaceBtwItems / 2),

            /// Details
            Padding(
              padding: const EdgeInsets.only(left: HptSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTitleText(title: product.title, smallSize: true),
                  const SizedBox(height: HptSizes.spaceBtwItems / 2),
                  Brandtitlewithverifiedicon(title: product.brand!.name),
                ],
              ),
            ),
            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    children:[
                      if(product.productType == ProductType.single.toString() && product.salePrice > 0)
                        Padding(
                          padding: const EdgeInsets.only(left: HptSizes.sm),
                          child: Text(product.price.toString(), style: Theme.of(context).textTheme.labelMedium!.apply(decoration: TextDecoration.lineThrough)),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(left: HptSizes.sm),
                        child: ProductPriceText(price: controller.getProductPrice(product)),
                      )
                    ]
                  ),
                ),
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
    );
  }
}
