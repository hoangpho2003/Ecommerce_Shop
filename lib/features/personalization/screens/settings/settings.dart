import 'package:ecommerce_hptshop/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_hptshop/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:ecommerce_hptshop/common/widgets/list_title/setting_menu_title.dart';
import 'package:ecommerce_hptshop/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_hptshop/features/authentication/screens/login/login.dart';
import 'package:ecommerce_hptshop/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce_hptshop/features/personalization/screens/address/address.dart';
import 'package:ecommerce_hptshop/features/shop/controllers/home_controller.dart';
import 'package:ecommerce_hptshop/features/shop/screens/order/order.dart';
import 'package:ecommerce_hptshop/utils/constants/colors.dart';
import 'package:ecommerce_hptshop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/list_title/user_profile_title.dart';
import '../../../../data/repositories/authentications/authentication_repository.dart';
import '../profile/profile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HptPrimaryHeaderContainer(
              child: Column(
                children: [
                  HptAppBar(title: Text('Account', style: Theme.of(context).textTheme.headlineMedium!.apply(color: HptColors.white))),
                  UserProfileTitle(onPressed: () => Get.to(() => const ProfileScreen())),
                  const SizedBox(height: HptSizes.spaceBtwSections),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(HptSizes.defaultSpace),
              child: Column(
                children: [
                  const HptSectionHeading(title: 'Account Settings'),
                  const SizedBox(height: HptSizes.spaceBtwItems),

                  SettingMenuTitle(icon: Iconsax.safe_home, title: 'My Address', subtitle: 'Set shopping delivery address', onTap: () => Get.to(() => const AddressScreen())),
                  const SettingMenuTitle(icon: Iconsax.shopping_cart, title: 'My Cart', subtitle: 'Add, remove products and move to checkout'),
                  SettingMenuTitle(icon: Iconsax.bag_tick, title: 'My Orders', subtitle: 'In-progress and Completed Orders', onTap: () => Get.to(() => const OrderScreen())),
                  const SettingMenuTitle(icon: Iconsax.bank, title: 'Bank Account', subtitle: 'Withdraw balance to registered bank account'),
                  const SettingMenuTitle(icon: Iconsax.discount_shape, title: 'My Coupons', subtitle: 'List of all the discounted coupons'),
                  const SettingMenuTitle(icon: Iconsax.notification, title: 'Notifications', subtitle: 'Set any kind of notification message'),
                  const SettingMenuTitle(icon: Iconsax.security_card, title: 'Account Privacy', subtitle: 'Manage data usage and connected accounts'),

                  const SizedBox(height: HptSizes.spaceBtwSections),
                  const HptSectionHeading(title: 'App Settings', showActionButton: false),
                  const SizedBox(height: HptSizes.spaceBtwItems),
                  SettingMenuTitle(
                    icon: Iconsax.document_upload,
                    title: 'Load Data',
                    subtitle: 'Upload Data to your Cloud Firebase',
                    onTap: () async {
                      await controller.uploadProducts();
                      // Hiển thị thông báo khi upload thành công
                      Get.snackbar('Success', 'Data uploaded to Firebase!', snackPosition: SnackPosition.BOTTOM);
                    },
                  ),
                  SettingMenuTitle(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subtitle: 'Set recommendation based on location',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ), // TSettingsMenuTile
                  SettingMenuTitle(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subtitle: 'Search result is safe for all ages',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  SettingMenuTitle(
                    icon: Iconsax.image,
                    title: 'HD Image Quality',
                    subtitle: 'Set image quality to be seen',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  const SizedBox(height: HptSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(onPressed: () => AuthenticationRepository.instance.logout(), child: const Text('Logout')),
                  ),
                  const SizedBox(height: HptSizes.spaceBtwSections * 2.5),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
