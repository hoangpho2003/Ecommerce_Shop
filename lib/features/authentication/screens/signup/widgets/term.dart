import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/signup/singup_controller.dart';

class HptTerm extends StatelessWidget {
  const HptTerm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = HptHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
            width: 24,
            height: 24,
            child: Obx(
              () => Checkbox(
                  value: controller.privacyPolicy.value,
                  onChanged: (value) => controller.privacyPolicy.value = !controller.privacyPolicy.value),
            )),
        const SizedBox(width: HptSizes.spaceBtwItems),
        Text.rich(
          TextSpan(children: [
            TextSpan(text: '${HptTexts.iAgreeTo} ', style: Theme.of(context).textTheme.bodySmall),
            TextSpan(
                text: HptTexts.privacyPolicy,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark ? HptColors.white : HptColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: dark ? HptColors.white : HptColors.primary,
                    )),
            TextSpan(text: ' ${HptTexts.and} ', style: Theme.of(context).textTheme.bodySmall),
            TextSpan(
                text: HptTexts.termsOfUse,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark ? HptColors.white : HptColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: dark ? HptColors.white : HptColors.primary,
                    )),
          ]),
        ),
      ],
    );
  }
}
