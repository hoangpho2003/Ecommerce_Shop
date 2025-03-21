import 'package:ecommerce_hptshop/features/shop/controllers/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/image_text_widgets/vertical_image_text.dart';
import '../../../../../common/widgets/shimmer/category_shimmer.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../sub_category/sub_categories.dart';

class HptHomeCategories extends StatelessWidget {
  const HptHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    return Obx(
      () {
        if (categoryController.isLoading.value) return const CategoryShimmer();
        if (categoryController.featuredCategories.isEmpty) {
          return Center(child: Text('No data found!', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)));
        }
        return SizedBox(
          height: 80,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: categoryController.featuredCategories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              final category = categoryController.featuredCategories[index];
              return HptVerticalImageText(image: category.image, title: category.name, onTap: () => Get.to(() => const SubCategories()));
            },
          ),
        );
      },
    );
  }
}
