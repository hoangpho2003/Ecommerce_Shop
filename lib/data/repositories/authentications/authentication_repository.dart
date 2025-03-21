import 'package:ecommerce_hptshop/features/authentication/screens/login/login.dart';
import 'package:ecommerce_hptshop/features/authentication/screens/onboarding/onboarding.dart';
import 'package:ecommerce_hptshop/features/authentication/screens/signup/verify_email.dart';
import 'package:ecommerce_hptshop/navigation_menu.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../user/user_repository.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  User? get authUser => _auth.currentUser;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    final user = _auth.currentUser;

    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      deviceStorage.writeIfNull('IsFirstTime', true);
      deviceStorage.read('IsFirstTime') != true ? Get.offAll(() => const LoginScreen()) : Get.offAll(const OnBoardingScreen());
    }
  }

  /// Login
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw HptFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw HptFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const HptFormatException();
    } on PlatformException catch (e) {
      throw HptPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again!';
    }
  }

  /// Signup with google
  Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;
      final credentials = GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw HptFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw HptFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const HptFormatException();
    } on PlatformException catch (e) {
      throw HptPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again!';
    }
  }

  /// Register
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw HptFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw HptFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const HptFormatException();
    } on PlatformException catch (e) {
      throw HptPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again!';
    }
  }

  /// Email Verification
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw HptFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw HptFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const HptFormatException();
    } on PlatformException catch (e) {
      throw HptPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again!';
    }
  }

  /// Forget Password
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw HptFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw HptFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const HptFormatException();
    } on PlatformException catch (e) {
      throw HptPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again!';
    }
  }

  /// RE Authenticate User
  Future<void> reAuthenticateWithEmailAndPassword (String email, String password) async {
    try {
      AuthCredential credential = EmailAuthProvider.credential (email: email, password: password);
      await _auth.currentUser!.reauthenticateWithCredential (credential);
    } on FirebaseAuthException catch (e) {
      throw HptFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw HptFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const HptFormatException();
    } on PlatformException catch (e) {
      throw HptPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again!';
    }
  }

  /// Logout
  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw HptFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw HptFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const HptFormatException();
    } on PlatformException catch (e) {
      throw HptPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again!';
    }
  }

  /// DELETE USER Remove user Auth and Firestore Account.
  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      throw HptFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw HptFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const HptFormatException();
    } on PlatformException catch (e) {
      throw HptPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again!';
    }
  }
}
