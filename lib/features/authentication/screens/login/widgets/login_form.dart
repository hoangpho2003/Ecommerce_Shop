import 'package:ecommerce_hptshop/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:ecommerce_hptshop/features/authentication/screens/signup/signup.dart';
import 'package:ecommerce_hptshop/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class HptLoginForm extends StatelessWidget {
  const HptLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: HptSizes.spaceBtwSections),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: HptTexts.email,
              ),
            ),
            const SizedBox(height: HptSizes.spaceBtwInputFields),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: HptTexts.password,
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            const SizedBox(height: HptSizes.spaceBtwInputFields / 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(HptTexts.rememberMe),
                  ],
                ),
                TextButton(onPressed: () => Get.to(() => const ForgetPassword()), child: const Text(HptTexts.forgetPassword)),
              ],
            ),
            const SizedBox(height: HptSizes.spaceBtwInputFields),
            SizedBox(
                width: double.infinity, child: ElevatedButton(onPressed: () => Get.to(() => const NavigationMenu()), child: const Text(HptTexts.signIn))),
            const SizedBox(height: HptSizes.spaceBtwItems),
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () => Get.to(() => const SignupScreen()), child: const Text(HptTexts.createAccount))),
          ],
        ),
      ),
    );
  }
}
