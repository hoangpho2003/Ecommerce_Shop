import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_hptshop/features/shop/controllers/banner_controller.dart';
import 'package:ecommerce_hptshop/utils/constants/colors.dart';
import 'package:ecommerce_hptshop/utils/effect/shimmer_effect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../utils/constants/sizes.dart';

class HptPromoSlider extends StatelessWidget {
  const HptPromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(
        () {
          if(controller.isLoading.value) return const ShimmerEffect(width: double.infinity, height: 190);

          if(controller.banners.isEmpty){
            return const Center(child: Text('No data found!'));
          }else{
            return Column(
              children: [
                CarouselSlider(
                    options: CarouselOptions(viewportFraction: 1, onPageChanged: (index, _) => controller.updatePAgeIndicator(index)),
                    items: controller.banners
                        .map(
                          (banner) => HptRoundedImage(
                        imageUrl: banner.imageUrl,
                        onPressed: () => Get.toNamed(banner.targetScreen),
                      ),
                    )
                        .toList()),
                const SizedBox(height: HptSizes.spaceBtwItems),
                Center(
                  child: Obx(
                        () => Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (int i = 0; i < controller.banners.length; i++)
                          HptCircularContainer(
                            width: 20,
                            height: 4,
                            margin: const EdgeInsets.only(right: 10),
                            backgroundColor: controller.carousalCurrentIndex.value == i ? HptColors.primary : HptColors.grey,
                          ),
                      ],
                    ),
                  ),
                )
              ],
            );
          }
        }
    );
  }
}
