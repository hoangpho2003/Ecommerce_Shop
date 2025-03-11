import 'package:ecommerce_hptshop/common/widgets/success_screen/success_screen.dart';
import 'package:ecommerce_hptshop/data/repositories/authentications/authentication_repository.dart';
import 'package:ecommerce_hptshop/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:ecommerce_hptshop/features/authentication/screens/login/login.dart';
import 'package:ecommerce_hptshop/utils/constants/image_strings.dart';
import 'package:ecommerce_hptshop/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => AuthenticationRepository.instance.logout(), icon: const Icon(CupertinoIcons.clear)),
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
              Text(email ?? '', style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),
              const SizedBox(height: HptSizes.spaceBtwItems),
              Text(HptTexts.confirmEmailSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox(height: HptSizes.spaceBtwSections),

              /// Buttons
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => controller.checkEmailVerificationStatus(),
                      child: const Text(HptTexts.tContinue))),
              const SizedBox(height: HptSizes.spaceBtwItems),
              SizedBox(width: double.infinity, child: TextButton(onPressed: () => controller.sendEmailVerification(), child: const Text(HptTexts.resendEmail))),
            ],
          ),
        ),
      ),
    );
  }
}
