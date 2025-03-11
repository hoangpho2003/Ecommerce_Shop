import 'package:ecommerce_hptshop/common/widgets/custom_shapes/containers/RoundedContainer.dart';
import 'package:ecommerce_hptshop/utils/constants/colors.dart';
import 'package:ecommerce_hptshop/utils/constants/sizes.dart';
import 'package:ecommerce_hptshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = HptHelperFunctions.isDarkMode(context);
    return HptRoundedContainer(
      padding: const EdgeInsets.all(HptSizes.md),
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAddress ? HptColors.primary.withOpacity(0.5) : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : dark
              ? HptColors.darkerGrey
              : HptColors.grey,
      margin: const EdgeInsets.only(bottom: HptSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color: selectedAddress
                  ? dark
                      ? HptColors.light
                      : HptColors.dark.withOpacity(0.2)
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hoang Pho',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: HptSizes.sm / 2),
              const Text('0922815775', maxLines: 1, overflow: TextOverflow.ellipsis),
              const SizedBox(height: HptSizes.sm / 2),
              const Text('65 Nguyen Minh Chau, Hoa Hai, Ngu Hanh Son, Da Nang', softWrap: true),
            ],
          )
        ],
      ),
    );
  }
}
