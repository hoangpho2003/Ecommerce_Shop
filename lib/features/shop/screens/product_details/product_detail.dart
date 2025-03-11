import 'package:ecommerce_hptshop/features/shop/models/product_model.dart';
import 'package:ecommerce_hptshop/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:ecommerce_hptshop/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:ecommerce_hptshop/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:ecommerce_hptshop/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:ecommerce_hptshop/features/shop/screens/product_details/widgets/rating_share.dart';
import 'package:ecommerce_hptshop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../product_reviews/product_review.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1 Product Image Slider
            const ProductImageSlider(),

            /// Product Detail
            Padding(
              padding: const EdgeInsets.only(right: HptSizes.defaultSpace, left: HptSizes.defaultSpace, bottom: HptSizes.defaultSpace),
              child: Column(
                children: [
                  const RatingAndShare(),
                  const ProductMetaData(),
                  const ProductAttributes(),
                  /// Checkout Button
                  SizedBox(width: double.infinity, child: ElevatedButton (onPressed: (){}, child: const Text('Checkout'))),
                  const SizedBox (height: HptSizes.spaceBtwSections),
                  /// Description
                  const HptSectionHeading (title: 'Description', showActionButton: false),
                  const SizedBox (height: HptSizes.spaceBtwItems),
                  const ReadMoreText(
                    'This is a Product description for Blue Nike Sleeve less vest. There are more things that can be added but',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Less',
                    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  ///- Reviews
                  const Divider(),
                  const SizedBox (height: HptSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const HptSectionHeading(title: 'Reviews (199)', showActionButton: false),
                      IconButton(icon: const Icon(Iconsax.arrow_right_3, size: 18), onPressed: () => Get.to(() => const ProductReviewScreen())),
                    ],
                  ),
                  const SizedBox (height: HptSizes.spaceBtwSections),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


