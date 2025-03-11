
import 'package:ecommerce_hptshop/common/widgets/texts/BrandTitleText.dart';
import 'package:ecommerce_hptshop/utils/constants/colors.dart';
import 'package:ecommerce_hptshop/utils/constants/enums.dart';
import 'package:ecommerce_hptshop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Brandtitlewithverifiedicon extends StatelessWidget {
  const Brandtitlewithverifiedicon(
      {super.key,
      required this.title,
      this.maxLines = 1,
      this.textColor,
      this.iconColor = HptColors.primary,
      this.textAlign = TextAlign.center,
      this.brandTextSize = TextSizes.small});

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: BrandTitleText(
            title: title,
            color: textColor,
            maxLines: maxLines,
            textAlign: textAlign,
            textSizes: brandTextSize
          ),
        ),
        const SizedBox(width: HptSizes.xs),
        Icon(Iconsax.verify5, color: iconColor, size: HptSizes.iconXs)
      ],
    );
  }
}
