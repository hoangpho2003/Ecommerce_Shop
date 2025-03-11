import 'package:ecommerce_hptshop/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_hptshop/common/widgets/custom_shapes/containers/RoundedContainer.dart';
import 'package:ecommerce_hptshop/common/widgets/success_screen/success_screen.dart';
import 'package:ecommerce_hptshop/features/shop/screens/Cart/widgets/cart_items.dart';
import 'package:ecommerce_hptshop/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:ecommerce_hptshop/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:ecommerce_hptshop/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:ecommerce_hptshop/navigation_menu.dart';
import 'package:ecommerce_hptshop/utils/constants/colors.dart';
import 'package:ecommerce_hptshop/utils/constants/image_strings.dart';
import 'package:ecommerce_hptshop/utils/constants/sizes.dart';
import 'package:ecommerce_hptshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/products/cart/coupon_widget.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HptHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: HptAppBar(showBackArrow: true, title: Text('Order Review', style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HptSizes.defaultSpace),
          child: Column(
            children: [
              const CartItems(showAddRemoveButtons: false),
              const SizedBox(height: HptSizes.spaceBtwSections),
              const CouponCode(),
              const SizedBox(height: HptSizes.spaceBtwSections),
              HptRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(HptSizes.md),
                backgroundColor: dark ? HptColors.black : HptColors.white,
                child: const Column(
                  children: [
                    BillingAmountSection(),
                    SizedBox(height: HptSizes.spaceBtwItems),
                    Divider(),
                    SizedBox(height: HptSizes.spaceBtwItems),
                    BillingPaymentSection(),
                    SizedBox(height: HptSizes.spaceBtwItems),
                    BillingAddressSection(),
                    SizedBox(height: HptSizes.spaceBtwItems),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(HptSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(() => SuccessScreen(
                image: HptImages.successfulPaymentIcon,
                title: 'Payment Success!',
                subTitle: 'Your item will be shipped soon!',
                onPressed: () => Get.offAll(() => const NavigationMenu()))),
            child: const Text('Checkout \$256')),
      ),
    );
  }
}
