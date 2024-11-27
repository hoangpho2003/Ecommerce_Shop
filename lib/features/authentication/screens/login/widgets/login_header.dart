import 'package:flutter/material.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class HptLoginHeader extends StatelessWidget {
  const HptLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HptHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: 150,
          image: AssetImage(dark ? HptImages.lightAppLogo : HptImages.darkAppLogo),
        ),
        Text(HptTexts.loginTitle, style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: HptSizes.sm),
        Text(HptTexts.loginSubTitle, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
