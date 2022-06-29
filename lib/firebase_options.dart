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
    apiKey: 'AIzaSyBh1sgx1f17nH2VZ4b3fLEX-4t1OfZ_MB4',
    appId: '1:1039890683514:web:9d3d166fcc1f643224cdc3',
    messagingSenderId: '1039890683514',
    projectId: 'taskone-17676',
    authDomain: 'taskone-17676.firebaseapp.com',
    storageBucket: 'taskone-17676.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCUA4bQFkPHDdpcf4C7sDj3xNTTZtZI6gk',
    appId: '1:1039890683514:android:34885ca32d1cbfc024cdc3',
    messagingSenderId: '1039890683514',
    projectId: 'taskone-17676',
    storageBucket: 'taskone-17676.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBZ5Xb69_SKrjN2OYb9hpct5L6zlksreSQ',
    appId: '1:1039890683514:ios:759f17c784b1f2a524cdc3',
    messagingSenderId: '1039890683514',
    projectId: 'taskone-17676',
    storageBucket: 'taskone-17676.appspot.com',
    iosClientId: '1039890683514-2pivenh869n8q0ci5bsddfr849v3k64c.apps.googleusercontent.com',
    iosBundleId: 'com.example.taskone',
  );
}