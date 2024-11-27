import 'package:ecommerce_hptshop/features/authentication/controllers/onboarding_controller.dart';
import 'package:ecommerce_hptshop/utils/constants/image_strings.dart';
import 'package:ecommerce_hptshop/utils/constants/text_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../widgets/OnBoardingDotNavigation.dart';
import '../widgets/OnBoardingNextButton.dart';
import '../widgets/onboarding_page.dart';
import '../widgets/onboarding_skip.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());

    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: HptImages.onBoardingImage1,
                title: HptTexts.onBoardingTitle1,
                subTitle: HptTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: HptImages.onBoardingImage2,
                title: HptTexts.onBoardingTitle2,
                subTitle: HptTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: HptImages.onBoardingImage3,
                title: HptTexts.onBoardingTitle3,
                subTitle: HptTexts.onBoardingSubTitle3,
              )
            ],
          ),

          /// Skip Button
          const OnBoardingSkip(),

          /// Dot Navigation SmoothPageIndicator
          const OnBoardingDotNavigation(),

          /// Circular Button
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}




