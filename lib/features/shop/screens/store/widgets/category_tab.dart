import 'package:ecommerce_hptshop/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_hptshop/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ecommerce_hptshop/common/widgets/texts/section_heading.dart';
import 'package:flutter/material.dart';
import '../../../../../common/widgets/brands/brand_showcase.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/product_controller.dart';
import '../../../models/category_model.dart';
import '../../../models/product_model.dart';
import 'package:get/get.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key, required this.categoryModel});

  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(HptSizes.defaultSpace),
          child: Column(
            children: [
              const BrandShowcase(images: [HptImages.productImage3, HptImages.productImage1, HptImages.productImage2]),
              const BrandShowcase(images: [HptImages.productImage3, HptImages.productImage1, HptImages.productImage2]),
              HptSectionHeading(title: 'You might like', onPressed: () {}),
              const SizedBox(height: HptSizes.spaceBtwItems),
              GridLayout(itemCount: controller.featuredProducts.length, itemBuilder: (_, index) => HptProductCardVertical(product: controller.featuredProducts[index])),
              const SizedBox(height: HptSizes.spaceBtwSections),
            ],
          ),
        ),
      ],
    );
  }
}
