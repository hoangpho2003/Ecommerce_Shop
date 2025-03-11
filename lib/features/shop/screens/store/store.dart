import 'package:ecommerce_hptshop/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_hptshop/common/widgets/appbar/tabbar.dart';
import 'package:ecommerce_hptshop/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:ecommerce_hptshop/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_hptshop/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:ecommerce_hptshop/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_hptshop/features/shop/controllers/category_controller.dart';
import 'package:ecommerce_hptshop/features/shop/screens/brands/all_brands.dart';
import 'package:ecommerce_hptshop/features/shop/screens/store/widgets/category_tab.dart';
import 'package:ecommerce_hptshop/utils/constants/colors.dart';
import 'package:ecommerce_hptshop/utils/constants/sizes.dart';
import 'package:ecommerce_hptshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../common/widgets/brands/brand_card.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: HptAppBar(
          title: Text('Store', style: Theme.of(context).textTheme.headlineMedium),
          actions: [HptCardCounterIcon(onPressed: () {}, iconColor: HptColors.black)],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: HptHelperFunctions.isDarkMode(context) ? HptColors.black : HptColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(HptSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      const SizedBox(height: HptSizes.spaceBtwItems),
                      const HptSearchContainer(text: 'Search in Store', showBorder: true, showBackground: false, padding: EdgeInsets.zero),
                      const SizedBox(height: HptSizes.spaceBtwSections),
                      HptSectionHeading(title: 'Featured Brands', onPressed: () => Get.to(() => const AllBrands())),
                      const SizedBox(height: HptSizes.spaceBtwItems / 1.5),
                      GridLayout(
                          itemCount: 4,
                          mainAxisExtent: 80,
                          itemBuilder: (_, index) {
                            return const BrandCard(showBorder: false);
                          })
                    ],
                  ),
                ),
                bottom: HptTabBar(tabs: categories.map((categories) => Tab(child: Text(categories.name))).toList()),
              ),
            ];
          },
          body: TabBarView(children: categories.map((categories) => CategoryTab(categoryModel: categories)).toList()),
        ),
      ),
    );
  }
}
