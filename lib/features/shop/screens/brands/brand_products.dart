import 'package:ecommerce_hptshop/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_hptshop/common/widgets/brands/brand_card.dart';
import 'package:ecommerce_hptshop/common/widgets/products/sortable/sortable_product.dart';
import 'package:ecommerce_hptshop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HptAppBar(title: Text('Nike')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(HptSizes.defaultSpace),
          child: Column(
            children: [
              /// Brand Details
              BrandCard(showBorder: true),
              SizedBox(height: HptSizes.spaceBtwSections),

              SortableProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
