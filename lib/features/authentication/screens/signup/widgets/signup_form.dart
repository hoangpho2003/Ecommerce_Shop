import 'package:ecommerce_hptshop/features/authentication/controllers/signup/singup_controller.dart';
import 'package:ecommerce_hptshop/features/authentication/screens/signup/widgets/term.dart';
import 'package:ecommerce_hptshop/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class HptSignForm extends StatelessWidget {
  const HptSignForm({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) => HptValidator.validateEmptyText('First Name', value),
                  expands: false,
                  decoration: const InputDecoration(labelText: HptTexts.firstName, prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(width: HptSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) => HptValidator.validateEmptyText('Last Name', value),
                  expands: false,
                  decoration: const InputDecoration(labelText: HptTexts.lastName, prefixIcon: Icon(Iconsax.user)),
                ),
              ),
            ],
          ),
          const SizedBox(height: HptSizes.spaceBtwInputFields),

          /// Username
          TextFormField(
            controller: controller.userName,
            validator: (value) => HptValidator.validateEmptyText('Username', value),
            expands: false,
            decoration: const InputDecoration(labelText: HptTexts.username, prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(height: HptSizes.spaceBtwInputFields),

          /// Email
          TextFormField(
            controller: controller.email,
            validator: (value) => HptValidator.validateEmail(value),
            decoration: const InputDecoration(labelText: HptTexts.email, prefixIcon: Icon(Iconsax.direct)),
          ),
          const SizedBox(height: HptSizes.spaceBtwInputFields),

          /// PhoneNo
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => HptValidator.validatePhoneNumber(value),
            decoration: const InputDecoration(labelText: HptTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
          ),
          const SizedBox(height: HptSizes.spaceBtwInputFields),

          /// Password
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) => HptValidator.validatePassword(value),
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                labelText: HptTexts.password,
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                  icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                ),
              ),
            ),
          ),
          const SizedBox(height: HptSizes.spaceBtwInputFields),

          /// Term&Conditions CheckBox
          const HptTerm(),
          const SizedBox(height: HptSizes.spaceBtwSections),

          /// Sign Up Button
          SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => controller.signup(), child: const Text(HptTexts.createAccount))),
        ],
      ),
    );
  }
}
