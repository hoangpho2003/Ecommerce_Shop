import 'package:ecommerce_hptshop/features/authentication/controllers/login/login_controller.dart';
import 'package:ecommerce_hptshop/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:ecommerce_hptshop/features/authentication/screens/signup/signup.dart';
import 'package:ecommerce_hptshop/navigation_menu.dart';
import 'package:ecommerce_hptshop/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class HptLoginForm extends StatelessWidget {
  const HptLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: HptSizes.spaceBtwSections),
        child: Column(
          children: [
            TextFormField(
              controller: controller.email,
              validator: (value) => HptValidator.validateEmail(value),
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: HptTexts.email,
              ),
            ),
            const SizedBox(height: HptSizes.spaceBtwInputFields),
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) => HptValidator.validateEmptyText('Password', value),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.password_check),
                  labelText: HptTexts.password,
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                    icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                  ),
                ),
              ),
            ),
            const SizedBox(height: HptSizes.spaceBtwInputFields / 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) => controller.rememberMe.value = !controller.rememberMe.value),
                    ),
                    const Text(HptTexts.rememberMe),
                  ],
                ),
                TextButton(onPressed: () => Get.to(() => const ForgetPassword()), child: const Text(HptTexts.forgetPassword)),
              ],
            ),
            const SizedBox(height: HptSizes.spaceBtwInputFields),
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () =>controller.emailAndPasswordSignIn(), child: const Text(HptTexts.signIn))),
            const SizedBox(height: HptSizes.spaceBtwItems),
            SizedBox(width: double.infinity, child: OutlinedButton(onPressed: () => Get.to(() => const SignupScreen()), child: const Text(HptTexts.createAccount))),
          ],
        ),
      ),
    );
  }
}
