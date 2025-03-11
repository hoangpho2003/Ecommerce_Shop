import 'package:ecommerce_hptshop/data/repositories/user/user_repository.dart';
import 'package:ecommerce_hptshop/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce_hptshop/features/personalization/screens/profile/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../utils/constants/image_strings.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loaders.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeName();
    super.onInit();
  }

  Future<void> initializeName() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      HptFullScreenLoader.openLoadingDialog('We are updating your information...', HptImages.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        HptFullScreenLoader.stopLoading();
        return;
      }
      if (!updateUserNameFormKey.currentState!.validate()) {
        HptFullScreenLoader.stopLoading();
        return;
      }

      Map<String, dynamic> name = {'FirstName': firstName.text.trim(), 'LastName': lastName.text.trim()};
      await userRepository.updateSingleField(name);

      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      HptFullScreenLoader.stopLoading();

      HptLoaders.successSnackBar(title: "Congratulations', message: Your Name has been updated.");

      Get.off(() => const ProfileScreen());
    } catch (e) {
      HptFullScreenLoader.stopLoading();
      HptLoaders.errorSnackBar(title: 'Oh, Snap!', message: e.toString());
    }
  }
}
