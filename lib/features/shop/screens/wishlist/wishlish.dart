import 'package:ecommerce_hptshop/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_hptshop/common/widgets/icons/circular_icon.dart';
import 'package:ecommerce_hptshop/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_hptshop/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ecommerce_hptshop/features/shop/screens/home/home.dart';
import 'package:ecommerce_hptshop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../controllers/product_controller.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      appBar: HptAppBar(
        title: Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          CircularIcon(icon: Iconsax.add, onPressed: () => Get.to(const HomeScreens())),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HptSizes.defaultSpace),
          child: GridLayout(itemCount: controller.featuredProducts.length, itemBuilder: (_, index) => HptProductCardVertical(product: controller.featuredProducts[index])),
        ),
      ),
    );
  }
}
