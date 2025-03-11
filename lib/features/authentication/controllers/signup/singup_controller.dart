import 'package:ecommerce_hptshop/data/repositories/authentications/authentication_repository.dart';
import 'package:ecommerce_hptshop/data/repositories/user/user_repository.dart';
import 'package:ecommerce_hptshop/features/authentication/screens/signup/verify_email.dart';
import 'package:ecommerce_hptshop/utils/constants/image_strings.dart';
import 'package:ecommerce_hptshop/utils/helpers/network_manager.dart';
import 'package:ecommerce_hptshop/utils/popups/full_screen_loader.dart';
import 'package:ecommerce_hptshop/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../personalization/models/user_model.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final hidePassword = true.obs;
  final privacyPolicy = false.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  void signup() async {
    try {
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      if (!signupFormKey.currentState!.validate()) return;

      if (!privacyPolicy.value) {
        HptLoaders.warningSnackBar(title: 'Accept Privacy Policy', message: 'In order to create account, you must have to read and accept the Privacy Policy & Terms Of Use.');
        return;
      }

      HptFullScreenLoader.openLoadingDialog('We are processing your information...', HptImages.docerAnimation);

      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: userName.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      userRepository.saveUserRecord(newUser);

      HptLoaders.successSnackBar(title: 'Congratulations', message: 'Your account has been created! Verify email to continue.');

      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      HptFullScreenLoader.stopLoading();
      HptLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
