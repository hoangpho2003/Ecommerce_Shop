import 'package:ecommerce_hptshop/features/authentication/controllers/onboarding_controller.dart';
import 'package:flutter/material.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: HptDeviceUtils.getAppBarHeight(),
      right: HptSizes.defaultSpace,
      child: TextButton(
        onPressed: () {},
        child: TextButton(onPressed: () => OnboardingController.instance.skipPage(), child: const Text('Skip')),
      ),
    );
  }
}
