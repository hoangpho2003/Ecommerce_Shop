import 'package:ecommerce_hptshop/data/repositories/authentications/authentication_repository.dart';
import 'package:ecommerce_hptshop/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:ecommerce_hptshop/utils/constants/image_strings.dart';
import 'package:ecommerce_hptshop/utils/helpers/network_manager.dart';
import 'package:ecommerce_hptshop/utils/popups/full_screen_loader.dart';
import 'package:ecommerce_hptshop/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController{
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  sendPasswordResetEmail() async{
    try{
      HptFullScreenLoader.openLoadingDialog('Processing your request...', HptImages.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        HptFullScreenLoader.stopLoading();
        return;
      }

      if(!forgetPasswordFormKey.currentState!.validate()){
        HptFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      HptFullScreenLoader.stopLoading();

      HptLoaders.successSnackBar(title: 'Email sent', message: 'Email link sent to reset your password.'.tr);

      Get.to(() => ResetPassword(email: email.text.trim()));
    } catch(e){
      HptFullScreenLoader.stopLoading();
      HptLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async{
    try{
      HptFullScreenLoader.openLoadingDialog('Processing your request...', HptImages.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        HptFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      HptFullScreenLoader.stopLoading();

      HptLoaders.successSnackBar(title: 'Email sent', message: 'Email link sent to reset your password.'.tr);
    } catch(e){
      HptFullScreenLoader.stopLoading();
      HptLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}