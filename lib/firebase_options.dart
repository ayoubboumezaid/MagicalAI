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
    apiKey: 'AIzaSyBrNOufMf7Daw5c3CIbizyCBvwEJSerapw',
    appId: '1:368338122055:web:e2b760d6cf4b7cabcec862',
    messagingSenderId: '368338122055',
    projectId: 'magicalai',
    authDomain: 'magicalai.firebaseapp.com',
    storageBucket: 'magicalai.appspot.com',
    measurementId: 'G-T3JFTRHN16',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDRKaZP2bjrrSvOrMfcwcH0YUlAdZKUNa0',
    appId: '1:368338122055:android:6f4134a611091505cec862',
    messagingSenderId: '368338122055',
    projectId: 'magicalai',
    storageBucket: 'magicalai.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCSU3bZXrbNy0gCWlUXF3tpZ0WrEpbVv3c',
    appId: '1:368338122055:ios:ca56e8679ae07469cec862',
    messagingSenderId: '368338122055',
    projectId: 'magicalai',
    storageBucket: 'magicalai.appspot.com',
    iosBundleId: 'com.example.magicalia',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCSU3bZXrbNy0gCWlUXF3tpZ0WrEpbVv3c',
    appId: '1:368338122055:ios:08c38a5029fb56cfcec862',
    messagingSenderId: '368338122055',
    projectId: 'magicalai',
    storageBucket: 'magicalai.appspot.com',
    iosBundleId: 'com.example.magicalia.RunnerTests',
  );
}
