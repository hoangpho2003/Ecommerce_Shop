import 'package:ecommerce_hptshop/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ecommerce_hptshop/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:ecommerce_hptshop/data/repositories/authentications/authentication_repository.dart';
import 'package:ecommerce_hptshop/features/shop/controllers/product_controller.dart';
import 'package:ecommerce_hptshop/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:ecommerce_hptshop/features/shop/screens/home/widgets/home_categories.dart';
import 'package:ecommerce_hptshop/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:ecommerce_hptshop/utils/constants/colors.dart';
import 'package:ecommerce_hptshop/utils/constants/image_strings.dart';
import 'package:ecommerce_hptshop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../all_products/all_products.dart';

class HomeScreens extends StatelessWidget {
  const HomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            const HptPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// Appbar
                  HptHomeAppBar(),
                  SizedBox(height: HptSizes.spaceBtwSections),

                  /// SearchBar
                  HptSearchContainer(text: 'Search in store'),
                  SizedBox(height: HptSizes.spaceBtwSections),

                  /// Categories
                  Padding(
                    padding: EdgeInsets.only(left: HptSizes.defaultSpace),
                    child: Column(
                      children: [
                        /// Heading
                        HptSectionHeading(title: 'Popular Categories', showActionButton: false, textColor: HptColors.white),
                        SizedBox(height: HptSizes.spaceBtwItems),

                        /// Categories
                        HptHomeCategories(),
                      ],
                    ),
                  ),

                  SizedBox(height: HptSizes.spaceBtwSections),
                ],
              ),
            ),

            /// Body
            Padding(
              padding: const EdgeInsets.all(HptSizes.defaultSpace),
              child: Column(
                children: [
                  /// Promo Slider
                  const HptPromoSlider(),
                  const SizedBox(height: HptSizes.spaceBtwSections),

                  /// Popular Products
                  HptSectionHeading(title: 'Popular Products', onPressed: () => Get.to(() => const AllProducts())),
                  const SizedBox(height: HptSizes.spaceBtwItems),
                  Obx(() {
                    if (controller.isLoading.value) return const TVerticalProductShimmer();
                    if (controller.featuredProducts.isEmpty) {
                      return Center(child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium));
                    }
                    return GridLayout(
                      itemCount: controller.featuredProducts.length,
                      itemBuilder: (_, index) =>  HptProductCardVertical(product: controller.featuredProducts[index]),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
