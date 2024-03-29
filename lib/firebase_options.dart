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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyB-ESRUBGvCN_vbR7sl1fDnTt29wM2ntlw',
    appId: '1:760162953245:web:7ae62242fa793676c87ef4',
    messagingSenderId: '760162953245',
    projectId: 'landk-83dd6',
    authDomain: 'landk-83dd6.firebaseapp.com',
    storageBucket: 'landk-83dd6.appspot.com',
    measurementId: 'G-4KNKFP44DV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDLxF-LNAhhF7ERr8JShX4rg3dRggvbLdQ',
    appId: '1:760162953245:android:8bd1b05f30c3f0c8c87ef4',
    messagingSenderId: '760162953245',
    projectId: 'landk-83dd6',
    storageBucket: 'landk-83dd6.appspot.com',
  );
}
