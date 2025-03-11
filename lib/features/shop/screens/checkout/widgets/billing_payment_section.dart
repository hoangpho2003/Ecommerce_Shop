import 'package:ecommerce_hptshop/common/widgets/custom_shapes/containers/RoundedContainer.dart';
import 'package:ecommerce_hptshop/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_hptshop/utils/constants/colors.dart';
import 'package:ecommerce_hptshop/utils/constants/image_strings.dart';
import 'package:ecommerce_hptshop/utils/constants/sizes.dart';
import 'package:ecommerce_hptshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HptHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        HptSectionHeading(title: 'Payment Method', buttonTitle: 'Change',  onPressed: (){}),
        const SizedBox(height: HptSizes.spaceBtwItems / 2),
        Row(
          children: [
            HptRoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? HptColors.light : HptColors.white,
              padding: const EdgeInsets.all(HptSizes.sm),
              child: const Image(image: AssetImage(HptImages.paypal), fit: BoxFit.contain),
            ),

            const SizedBox(width: HptSizes.spaceBtwItems / 2),
            Text('Paypal', style: Theme.of(context).textTheme.bodyLarge),
          ],
        )
      ],
    );
  }
}
