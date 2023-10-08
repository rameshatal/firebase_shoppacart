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
        return macos;
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
    apiKey: 'AIzaSyD1V334nhzBx4mIGivQ-1ZkT9Z5Sdiv4CQ',
    appId: '1:879408486345:web:6a1f731c43958733cf7a18',
    messagingSenderId: '879408486345',
    projectId: 'fir-shoppacart',
    authDomain: 'fir-shoppacart.firebaseapp.com',
    storageBucket: 'fir-shoppacart.appspot.com',
    measurementId: 'G-GSM41EB75H',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCNP4_VQqzRr28DFQCvgJFhhPdeEcms4y0',
    appId: '1:879408486345:android:eff980fec2dfaeb7cf7a18',
    messagingSenderId: '879408486345',
    projectId: 'fir-shoppacart',
    storageBucket: 'fir-shoppacart.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBKktgKRKcj-4fL87aHJc5thDVUZBLx7eM',
    appId: '1:879408486345:ios:ee22102a2565e495cf7a18',
    messagingSenderId: '879408486345',
    projectId: 'fir-shoppacart',
    storageBucket: 'fir-shoppacart.appspot.com',
    iosBundleId: 'com.example.firebaseShoppacart',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBKktgKRKcj-4fL87aHJc5thDVUZBLx7eM',
    appId: '1:879408486345:ios:7f328801df4fdd80cf7a18',
    messagingSenderId: '879408486345',
    projectId: 'fir-shoppacart',
    storageBucket: 'fir-shoppacart.appspot.com',
    iosBundleId: 'com.example.firebaseShoppacart.RunnerTests',
  );
}