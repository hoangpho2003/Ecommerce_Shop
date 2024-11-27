import 'package:flutter/material.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';

class HptHomeAppBar extends StatelessWidget {
  const HptHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return HptAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(HptTexts.homeAppbarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: HptColors.grey)),
          Text(HptTexts.homeAppbarSubTitle, style: Theme.of(context).textTheme.headlineSmall!.apply(color: HptColors.white)),
        ],
      ),
      actions: [
        HptCardCounterIcon(onPressed: () {}, iconColor: HptColors.white,)
      ],
    );
  }
}