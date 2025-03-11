import 'package:ecommerce_hptshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HptHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: HptSizes.defaultSpace, vertical: HptSizes.defaultSpace / 2),
      decoration: BoxDecoration(
          color: dark ? HptColors.darkerGrey : HptColors.light,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(HptSizes.cardRadiusLg),
            topRight: Radius.circular(HptSizes.cardRadiusLg),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircularIcon(
                icon: Iconsax.minus,
                backgroundColor: HptColors.darkGrey,
                width: 40,
                height: 40,
                color: HptColors.white,
              ),
              const SizedBox(width: HptSizes.spaceBtwItems),
              Text('2', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(width: HptSizes.spaceBtwItems),
              const CircularIcon(
                icon: Iconsax.add,
                backgroundColor: HptColors.black,
                width: 40,
                height: 40,
                color: HptColors.white,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(HptSizes.md), backgroundColor: HptColors.black, side: const BorderSide(color: HptColors.black)),
            child: const Text('Add to Cart'),
          )
        ],
      ),
    );
  }
}
