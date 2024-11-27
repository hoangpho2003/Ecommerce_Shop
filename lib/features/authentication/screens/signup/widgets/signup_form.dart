import 'package:ecommerce_hptshop/features/authentication/screens/signup/verify_email.dart';
import 'package:ecommerce_hptshop/features/authentication/screens/signup/widgets/term.dart';
import 'package:ecommerce_hptshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
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
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration:
                  const InputDecoration(labelText: HptTexts.firstName, prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(width: HptSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration:
                  const InputDecoration(labelText: HptTexts.lastName, prefixIcon: Icon(Iconsax.user)),
                ),
              ),
            ],
          ),
          const SizedBox(height: HptSizes.spaceBtwInputFields),

          /// Username
          TextFormField(
            expands: false,
            decoration:
            const InputDecoration(labelText: HptTexts.username, prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(height: HptSizes.spaceBtwInputFields),

          /// Email
          TextFormField(
            decoration: const InputDecoration(labelText: HptTexts.email, prefixIcon: Icon(Iconsax.direct)),
          ),
          const SizedBox(height: HptSizes.spaceBtwInputFields),

          /// PhoneNo
          TextFormField(
            decoration: const InputDecoration(labelText: HptTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
          ),
          const SizedBox(height: HptSizes.spaceBtwInputFields),

          /// Password
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              labelText: HptTexts.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
          ),
          const SizedBox(height: HptSizes.spaceBtwInputFields),

          /// Term&Conditions CheckBox
          const HptTerm(),
          const SizedBox(height: HptSizes.spaceBtwSections),

          /// Sign Up Button
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () => Get.to(() => const VerifyEmailScreen()), child: const Text(HptTexts.createAccount))),
        ],
      ),
    );
  }
}

