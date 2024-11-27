import 'package:ecommerce_hptshop/common/widgets/login_sigup/form_divider.dart';
import 'package:ecommerce_hptshop/common/widgets/success_screen/success_screen.dart';
import 'package:ecommerce_hptshop/features/authentication/screens/login/login.dart';
import 'package:ecommerce_hptshop/utils/constants/image_strings.dart';
import 'package:ecommerce_hptshop/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.offAll(() => const LoginScreen()), icon: const Icon(CupertinoIcons.clear)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HptSizes.defaultSpace),
          child: Column(
            children: [
              /// Image
              Image(image: const AssetImage(HptImages.deliveredEmailIllustration), width: HptHelperFunctions.screenWidth() * 0.6),
              const SizedBox(height: HptSizes.spaceBtwSections),

              /// Title
              Text(HptTexts.confirmEmail, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: HptSizes.spaceBtwItems),
              Text('photh.21it.support@gmail.com', style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),
              const SizedBox(height: HptSizes.spaceBtwItems),
              Text(HptTexts.confirmEmailSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox(height: HptSizes.spaceBtwSections),

              /// Buttons
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => Get.to(
                              () => SuccessScreen(
                            image: HptImages.staticSuccessIllustration,
                            title: HptTexts.yourAccountCreatedTitle,
                            subTitle: HptTexts.yourAccountCreatedSubTitle,
                            onPressed: () => Get.to(() => const LoginScreen()),
                          )),
                      child: const Text(HptTexts.tContinue))),
              const SizedBox(height: HptSizes.spaceBtwItems),
              SizedBox(width: double.infinity, child: TextButton(onPressed: () {}, child: const Text(HptTexts.resendEmail))),
            ],
          ),
        ),
      ),
    );
  }
}
