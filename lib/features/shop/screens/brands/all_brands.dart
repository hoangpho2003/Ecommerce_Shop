import 'package:ecommerce_hptshop/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_hptshop/common/widgets/brands/brand_card.dart';
import 'package:ecommerce_hptshop/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_hptshop/common/widgets/products/sortable/sortable_product.dart';
import 'package:ecommerce_hptshop/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_hptshop/features/shop/screens/brands/brand_products.dart';
import 'package:ecommerce_hptshop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AllBrands extends StatelessWidget {
  const AllBrands({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HptAppBar(title: Text('Brand'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HptSizes.defaultSpace),
          child: Column(
            children: [
              const HptSectionHeading(title: 'Brands', showActionButton: false),
              const SizedBox(height: HptSizes.spaceBtwItems),
              GridLayout(
                itemCount: 10,
                mainAxisExtent: 80,
                itemBuilder: (context, index) => BrandCard(
                  showBorder: true,
                  onTap: () => Get.to(() => const BrandProducts()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
