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
    apiKey: 'AIzaSyATS4iST9DPuyZPPrG58YeBO98fKsR9T1U',
    appId: '1:654365174406:web:14da9bb80f13e2a5093f07',
    messagingSenderId: '654365174406',
    projectId: 'test-bae0c',
    authDomain: 'test-bae0c.firebaseapp.com',
    storageBucket: 'test-bae0c.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBc_Qx7I64wgpBg0y8jeqCA43hyCu-tsaE',
    appId: '1:654365174406:android:0dfef14b2b3b9212093f07',
    messagingSenderId: '654365174406',
    projectId: 'test-bae0c',
    storageBucket: 'test-bae0c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDFFvjAgAWYGbGYyJFOxhJkd05vmAlTVb8',
    appId: '1:654365174406:ios:af80b2a7d6e05d7c093f07',
    messagingSenderId: '654365174406',
    projectId: 'test-bae0c',
    storageBucket: 'test-bae0c.appspot.com',
    iosClientId: '654365174406-2753s85e11602uisk7m0j7aq1oed4uso.apps.googleusercontent.com',
    iosBundleId: 'com.example.projetSm',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDFFvjAgAWYGbGYyJFOxhJkd05vmAlTVb8',
    appId: '1:654365174406:ios:af80b2a7d6e05d7c093f07',
    messagingSenderId: '654365174406',
    projectId: 'test-bae0c',
    storageBucket: 'test-bae0c.appspot.com',
    iosClientId: '654365174406-2753s85e11602uisk7m0j7aq1oed4uso.apps.googleusercontent.com',
    iosBundleId: 'com.example.projetSm',
  );
}
