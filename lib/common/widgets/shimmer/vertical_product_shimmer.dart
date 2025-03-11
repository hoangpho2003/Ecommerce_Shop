import 'package:flutter/material.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/effect/shimmer_effect.dart';
import '../layouts/grid_layout.dart';

class TVerticalProductShimmer extends StatelessWidget {
  const TVerticalProductShimmer({
    super.key,
    this.itemCount = 4,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return GridLayout(
      itemCount: itemCount,
      itemBuilder: (_, __) =>
      const SizedBox (
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Image
            ShimmerEffect(width: 180, height: 180),
            SizedBox(height: HptSizes.spaceBtwItems),

            /// Text
            ShimmerEffect(width: 160, height: 15),
            SizedBox(height: HptSizes.spaceBtwItems / 2),
            ShimmerEffect(width: 110, height: 15),
          ],
        ), // Column
      ), // SizedBox
    ); // TGridLayout
  }
}