import 'package:ecommerce_hptshop/common/widgets/chip/choice_chip.dart';
import 'package:ecommerce_hptshop/common/widgets/custom_shapes/containers/RoundedContainer.dart';
import 'package:ecommerce_hptshop/common/widgets/texts/product_price_text.dart';
import 'package:ecommerce_hptshop/common/widgets/texts/product_title_text.dart';
import 'package:ecommerce_hptshop/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_hptshop/utils/constants/colors.dart';
import 'package:ecommerce_hptshop/utils/constants/sizes.dart';
import 'package:ecommerce_hptshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HptHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        HptRoundedContainer(
          padding: const EdgeInsets.all(HptSizes.md),
          backgroundColor: dark ? HptColors.darkerGrey : HptColors.grey,
          child: Column(
            children: [
              Row(
                children: [
                  const HptSectionHeading(title: 'Variation', showActionButton: false),
                  const SizedBox(width: HptSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const ProductTitleText(title: 'Price : ', smallSize: true),
                          const SizedBox(height: HptSizes.spaceBtwItems),
                          Text('\$25', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
                          const SizedBox(width: HptSizes.spaceBtwItems),
                          const ProductPriceText(price: '20'),
                        ],
                      ),
                      Row(
                        children: [const ProductTitleText(title: 'Stock : ', smallSize: true), Text('In Stock', style: Theme.of(context).textTheme.titleMedium)],
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: HptSizes.spaceBtwItems / 2),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTitleText(
                    title: 'This is description',
                    smallSize: true,
                    maxLines: 4,
                  ),
                ],
              ),

            ],
          ),
        ),
        const SizedBox(height: HptSizes.spaceBtwItems / 2),

        /// Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HptSectionHeading(title: 'Colors'),
            const SizedBox(height: HptSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                HptChoiceChip(text: 'Green', selected: true, onSelected: (value){}),
                HptChoiceChip(text: 'Blue', selected: false, onSelected: (value){}),
                HptChoiceChip(text: 'Yellow', selected: false, onSelected: (value){}),
                HptChoiceChip(text: 'Green', selected: false, onSelected: (value){}),
                HptChoiceChip(text: 'Blue', selected: false, onSelected: (value){}),
                HptChoiceChip(text: 'Yellow', selected: false, onSelected: (value){}),
                HptChoiceChip(text: 'Green', selected: false, onSelected: (value){}),
                HptChoiceChip(text: 'Blue', selected: false, onSelected: (value){}),
                HptChoiceChip(text: 'Yellow', selected: false, onSelected: (value){}),
              ],
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HptSectionHeading(title: 'Sizes'),
            const SizedBox(height: HptSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                HptChoiceChip(text: '34', selected: true, onSelected: (value){}),
                HptChoiceChip(text: '35', selected: false, onSelected: (value){}),
                HptChoiceChip(text: '36', selected: false, onSelected: (value){}),
                HptChoiceChip(text: '37', selected: false, onSelected: (value){}),
                HptChoiceChip(text: '38', selected: false, onSelected: (value){}),
                HptChoiceChip(text: '39', selected: false, onSelected: (value){}),
                HptChoiceChip(text: '40', selected: false, onSelected: (value){}),
                HptChoiceChip(text: '41', selected: false, onSelected: (value){}),
                HptChoiceChip(text: '42', selected: false, onSelected: (value){}),
              ],
            )
          ],
        ),
        const SizedBox (height: HptSizes.spaceBtwSections),
      ],
    );
  }
}
