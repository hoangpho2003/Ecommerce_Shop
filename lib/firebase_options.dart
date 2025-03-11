// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyC09M1aQkepci6wEJ49furkrgrCHu6zxNo',
    appId: '1:562379358276:web:e472589e31734a7ea3bc11',
    messagingSenderId: '562379358276',
    projectId: 'ecommerce-dd835',
    authDomain: 'ecommerce-dd835.firebaseapp.com',
    storageBucket: 'ecommerce-dd835.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAQ8ogT7e7AVv1qL7bS3sEWjmDSd_R3e5A',
    appId: '1:562379358276:android:655729aa31a1b566a3bc11',
    messagingSenderId: '562379358276',
    projectId: 'ecommerce-dd835',
    storageBucket: 'ecommerce-dd835.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBpbu-xPEWI84heh-dzxIXNPxi2O14mCNM',
    appId: '1:562379358276:ios:059c00423fb73e59a3bc11',
    messagingSenderId: '562379358276',
    projectId: 'ecommerce-dd835',
    storageBucket: 'ecommerce-dd835.firebasestorage.app',
    androidClientId: '562379358276-1nq6j9be52p0rstescv5gi3qpg78kujm.apps.googleusercontent.com',
    iosClientId: '562379358276-v53vf4arq1peb815dr8qvkiu6btr0b4j.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecommerceHptshop',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBpbu-xPEWI84heh-dzxIXNPxi2O14mCNM',
    appId: '1:562379358276:ios:059c00423fb73e59a3bc11',
    messagingSenderId: '562379358276',
    projectId: 'ecommerce-dd835',
    storageBucket: 'ecommerce-dd835.firebasestorage.app',
    androidClientId: '562379358276-1nq6j9be52p0rstescv5gi3qpg78kujm.apps.googleusercontent.com',
    iosClientId: '562379358276-v53vf4arq1peb815dr8qvkiu6btr0b4j.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecommerceHptshop',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC09M1aQkepci6wEJ49furkrgrCHu6zxNo',
    appId: '1:562379358276:web:e649ac5b9e9a7bdda3bc11',
    messagingSenderId: '562379358276',
    projectId: 'ecommerce-dd835',
    authDomain: 'ecommerce-dd835.firebaseapp.com',
    storageBucket: 'ecommerce-dd835.firebasestorage.app',
  );

}