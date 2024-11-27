import 'package:ecommerce_hptshop/features/authentication/screens/login/widgets/login_form.dart';
import 'package:ecommerce_hptshop/features/authentication/screens/login/widgets/login_header.dart';
import 'package:ecommerce_hptshop/utils/constants/text_strings.dart';
import 'package:ecommerce_hptshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/styles/spacing_styles.dart';
import '../../../../common/widgets/login_sigup/form_divider.dart';
import '../../../../common/widgets/login_sigup/social_buttons.dart';
import '../../../../utils/constants/sizes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HptHelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: HptSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Logo, Title
              const HptLoginHeader(),

              /// Form
              const HptLoginForm(),

              /// Divider
              HptFormDivider(dividerText: HptTexts.orSignInWith.capitalize!),
              const SizedBox(height: HptSizes.spaceBtwSections,),

              /// Footer
              const HptSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}







