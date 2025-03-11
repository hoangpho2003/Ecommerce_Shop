import 'package:ecommerce_hptshop/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_hptshop/common/widgets/images/rounded_image.dart';
import 'package:ecommerce_hptshop/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:ecommerce_hptshop/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_hptshop/utils/constants/image_strings.dart';
import 'package:ecommerce_hptshop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SubCategories extends StatelessWidget {
  const SubCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HptAppBar(title: Text('Sports'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HptSizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              const HptRoundedImage(width: double.infinity, imageUrl: HptImages.promoBanner3, applyImageRadius: true),
              const SizedBox(height: HptSizes.spaceBtwSections),

              /// Sub-Categories
              Column(
                children: [
                  HptSectionHeading(title: 'Sports shirts', onPressed: () {}),
                  const SizedBox(height: HptSizes.spaceBtwItems / 2),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => const SizedBox(width: HptSizes.spaceBtwItems),
                      itemBuilder: (context, index) => const HptProductCardHorizontal(),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
