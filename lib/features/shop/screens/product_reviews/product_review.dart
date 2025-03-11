import 'package:ecommerce_hptshop/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_hptshop/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:ecommerce_hptshop/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:ecommerce_hptshop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/products/ratings/rating_indicator.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HptAppBar(title: Text('Reviews & Ratings'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HptSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('All of Reviews and Ratings will be show here'),
              const SizedBox(height: HptSizes.spaceBtwItems),
              const OverallProductRating(),
              const HptRatingBarIndicator(rating: 3.5),
              Text('12,611', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: HptSizes.spaceBtwSections),
              const ReviewCard(),
              const ReviewCard(),
              const ReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
