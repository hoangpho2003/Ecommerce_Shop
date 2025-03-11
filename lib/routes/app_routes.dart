import 'package:ecommerce_hptshop/routes/routes.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../features/authentication/screens/login/login.dart';
import '../features/authentication/screens/onboarding/onboarding.dart';
import '../features/authentication/screens/password_configuration/forget_password.dart';
import '../features/authentication/screens/signup/signup.dart';
import '../features/authentication/screens/signup/verify_email.dart';
import '../features/personalization/screens/address/address.dart';
import '../features/personalization/screens/profile/profile.dart';
import '../features/personalization/screens/settings/settings.dart';
import '../features/shop/screens/Cart/cart.dart';
import '../features/shop/screens/checkout/checkout.dart';
import '../features/shop/screens/home/home.dart';
import '../features/shop/screens/order/order.dart';
import '../features/shop/screens/product_reviews/product_review.dart';
import '../features/shop/screens/store/store.dart';
import '../features/shop/screens/wishlist/wishlish.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: HptRoutes.home, page: () => const HomeScreens()),
    GetPage(name: HptRoutes.store, page: () => const Store()),
    GetPage(name: HptRoutes.favourites, page: () => const FavouriteScreen()),
    GetPage(name: HptRoutes.settings, page: () => const SettingsScreen()),
    GetPage(name: HptRoutes.productReviews, page: () => const ProductReviewScreen()),
    GetPage(name: HptRoutes.order, page: () => const OrderScreen()),
    GetPage(name: HptRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: HptRoutes.cart, page: () => const CartScreen()),
    GetPage(name: HptRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: HptRoutes.userAddress, page: () => const AddressScreen()),
    GetPage(name: HptRoutes.signup, page: () => const SignupScreen()),
    GetPage(name: HptRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: HptRoutes.signIn, page: () => const LoginScreen()),
    GetPage(name: HptRoutes.forgetPassword, page: () => const ForgetPassword()),
    GetPage(name: HptRoutes.onBoarding, page: () => const OnBoardingScreen()),
// Add more GetPage entries as needed
  ];
}