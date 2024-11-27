import 'package:ecommerce_hptshop/utils/constants/image_strings.dart';
import 'package:ecommerce_hptshop/utils/constants/text_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [IconButton(onPressed: () => Get.back(), icon: const Icon(CupertinoIcons.clear))],
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
              Text(HptTexts.changeYourPasswordTitle, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: HptSizes.spaceBtwItems),
              Text(HptTexts.changeYourPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox(height: HptSizes.spaceBtwSections),

              /// Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: (){}, child: const Text(HptTexts.done)),
              ),
              const SizedBox(height: HptSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(onPressed: (){}, child: const Text(HptTexts.resendEmail)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
