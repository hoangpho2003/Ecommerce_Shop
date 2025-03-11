import 'package:ecommerce_hptshop/common/widgets/custom_shapes/containers/RoundedContainer.dart';
import 'package:ecommerce_hptshop/utils/constants/colors.dart';
import 'package:ecommerce_hptshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import '../../../../../common/widgets/products/ratings/rating_indicator.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HptHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(backgroundImage: AssetImage(HptImages.userProfileImage1)),
                const SizedBox(width: HptSizes.spaceBtwItems),
                Text('John Doe', style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(height: HptSizes.spaceBtwItems),

        /// Review
        Row(
          children: [
            const HptRatingBarIndicator(rating: 4),
            const SizedBox(width: HptSizes.spaceBtwItems),
            Text('01 Nov, 2023', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: HptSizes.spaceBtwItems),
        const ReadMoreText(
          'All of comment of users be showed in here!',
          trimLines: 1,
          trimMode: TrimMode.Line,
          trimExpandedText: 'show less',
          trimCollapsedText: 'show more',
          moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: HptColors.primary),
          lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: HptColors.primary),
        ),
        const SizedBox(height: HptSizes.spaceBtwItems),

        HptRoundedContainer(
          backgroundColor: dark ? HptColors.darkerGrey : HptColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(HptSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("HPT Store", style: Theme.of(context).textTheme.titleMedium),
                    Text("02 Nov, 2024", style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                const SizedBox(height: HptSizes.spaceBtwItems),
                const ReadMoreText(
                  'All of comment of users be showed in here!',
                  trimLines: 1,
                  trimMode: TrimMode.Line,
                  trimExpandedText: 'show less',
                  trimCollapsedText: 'show more',
                  moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: HptColors.primary),
                  lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: HptColors.primary),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
