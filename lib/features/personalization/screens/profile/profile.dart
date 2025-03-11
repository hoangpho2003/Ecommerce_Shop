import 'package:ecommerce_hptshop/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_hptshop/common/widgets/images/circular_image.dart';
import 'package:ecommerce_hptshop/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_hptshop/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:ecommerce_hptshop/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:ecommerce_hptshop/utils/constants/sizes.dart';
import 'package:ecommerce_hptshop/utils/effect/shimmer_effect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../controllers/user_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const HptAppBar(showBackArrow: true, title: Text('Profile')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HptSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty ? networkImage : HptImages.user;
                      return controller.imageUploading.value
                          ? const ShimmerEffect(width: 80, height: 80, radius: 80)
                          : CircularImage(image: image, width: 80, height: 80, isNetworkImage: networkImage.isNotEmpty);
                    }),
                    TextButton(onPressed: () => controller.uploadUserProfilePicture(), child: const Text('Change Profile Picture')),
                  ],
                ),
              ),

              /// Details
              const SizedBox(height: HptSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: HptSizes.spaceBtwItems),
              const HptSectionHeading(title: 'Profile Information', showActionButton: false),
              const SizedBox(height: HptSizes.spaceBtwItems),

              ProfileMenu(onPressed: () => Get.to(() => const ChangeName()), title: 'Name', value: controller.user.value.fullName),
              ProfileMenu(onPressed: () {}, title: 'Username', value: controller.user.value.username),

              const SizedBox(height: HptSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: HptSizes.spaceBtwItems),

              const HptSectionHeading(title: 'Personal Information', showActionButton: false),
              const SizedBox(height: HptSizes.spaceBtwItems),

              ProfileMenu(onPressed: () {}, title: 'User iD', value: controller.user.value.id, icon: Iconsax.copy),
              ProfileMenu(onPressed: () {}, title: 'Email', value: controller.user.value.email),
              ProfileMenu(onPressed: () {}, title: 'Phone Number', value: controller.user.value.phoneNumber),
              ProfileMenu(onPressed: () {}, title: 'Gender', value: 'Male'),
              ProfileMenu(onPressed: () {}, title: 'Birthday', value: '21/11/2003'),
              const Divider(),
              const SizedBox(height: HptSizes.spaceBtwItems),

              Center(
                child: TextButton(onPressed: () => controller.deleteAccountWarningPopup(), child: const Text('Close account', style: TextStyle(color: Colors.red))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
