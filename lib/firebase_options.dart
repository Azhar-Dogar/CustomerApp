// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBAeEXmpn6SEagyL_ZHCehjLPlF_IU8yew',
    appId: '1:358074586334:web:7d59e2d6d885a8458fde4f',
    messagingSenderId: '358074586334',
    projectId: 'eshop-c4ebf',
    authDomain: 'eshop-c4ebf.firebaseapp.com',
    storageBucket: 'eshop-c4ebf.appspot.com',
    measurementId: 'G-WF8R2CEPBF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDh6lJSUhBGRJyHSZFy4I_VH7V667Kkl5A',
    appId: '1:358074586334:android:9924bd5ff73804b98fde4f',
    messagingSenderId: '358074586334',
    projectId: 'eshop-c4ebf',
    storageBucket: 'eshop-c4ebf.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA4lEVmxvNH1L9bQtMz-TA11xtoOnz3kuI',
    appId: '1:358074586334:ios:043391a378b074ce8fde4f',
    messagingSenderId: '358074586334',
    projectId: 'eshop-c4ebf',
    storageBucket: 'eshop-c4ebf.appspot.com',
    iosClientId: '358074586334-mh577ombiqv00igb17hjsgfas3j41lnl.apps.googleusercontent.com',
    iosBundleId: 'wrteam.eshop.multivendor',
  );
}