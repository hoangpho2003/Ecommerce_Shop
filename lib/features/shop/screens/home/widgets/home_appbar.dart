import 'package:ecommerce_hptshop/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce_hptshop/utils/effect/shimmer_effect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';

class HptHomeAppBar extends StatelessWidget {
  const HptHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return HptAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(HptTexts.homeAppbarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: HptColors.grey)),
          Obx(() {
            if (controller.profileLoading.value) {
              return const ShimmerEffect(width: 80, height: 15);
            } else {
              return Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineSmall!.apply(color: HptColors.white));
            }
          }),
        ],
      ),
      actions: [HptCardCounterIcon(onPressed: () {}, iconColor: HptColors.white, counterBgColor: HptColors.black, counterTextColor: HptColors.white)],
    );
  }
}
