import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_hptshop/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:ecommerce_hptshop/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ecommerce_hptshop/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:ecommerce_hptshop/features/shop/screens/home/widgets/home_categories.dart';
import 'package:ecommerce_hptshop/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:ecommerce_hptshop/utils/constants/colors.dart';
import 'package:ecommerce_hptshop/utils/constants/image_strings.dart';
import 'package:ecommerce_hptshop/utils/constants/sizes.dart';
import 'package:ecommerce_hptshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/image_text_widgets/vertical_image_text.dart';
import '../../../../common/widgets/images/rounded_image.dart';
import '../../../../common/widgets/texts/section_heading.dart';

class HomeScreens extends StatelessWidget {
  const HomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            HptPrimaryHeaderContainer(
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
                  )
                ],
              ),
            ),

            /// Body
            Padding(
              padding: EdgeInsets.all(HptSizes.defaultSpace),
              child: Column(
                children: [
                  /// Promo Slider
                  HptPromoSlider(banners: [HptImages.promoBanner1, HptImages.promoBanner2, HptImages.promoBanner3]),
                  SizedBox(height: HptSizes.spaceBtwSections),
                  /// Popular Products
                  HptProductCardVertical(),

                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}


