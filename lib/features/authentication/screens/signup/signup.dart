import 'package:ecommerce_hptshop/common/widgets/login_sigup/form_divider.dart';
import 'package:ecommerce_hptshop/common/widgets/login_sigup/social_buttons.dart';
import 'package:ecommerce_hptshop/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:ecommerce_hptshop/utils/constants/colors.dart';
import 'package:ecommerce_hptshop/utils/constants/sizes.dart';
import 'package:ecommerce_hptshop/utils/constants/text_strings.dart';
import 'package:ecommerce_hptshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HptHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HptSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(HptTexts.signupTitle, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: HptSizes.spaceBtwSections),

              HptSignForm(dark: dark),
              const SizedBox(height: HptSizes.spaceBtwSections),

              /// Divider
              HptFormDivider(dividerText: HptTexts.orSignUpWith.capitalize!),
              const SizedBox(height: HptSizes.spaceBtwSections),

              /// Social Buttons
              const HptSocialButtons(),
              const SizedBox(height: HptSizes.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }
}

