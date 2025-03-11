import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class HptVerticalImageText extends StatelessWidget {
  const HptVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = HptColors.white,
    this.backgroundColor = HptColors.white,
    this.onTap,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = HptHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: HptSizes.spaceBtwItems),
        child: Column(
          children: [
            /// Icon
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(HptSizes.sm),
              decoration: BoxDecoration(
                color: backgroundColor ?? (dark ? HptColors.black : HptColors.white),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Image(image: AssetImage(image), fit: BoxFit.cover, color: HptColors.dark),
              ),
            ),

            /// Text
            const SizedBox(height: HptSizes.spaceBtwItems / 2),
            SizedBox(
              width: 55,
              child: Center(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.labelMedium!.apply(color: textColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
