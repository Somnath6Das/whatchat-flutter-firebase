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
    apiKey: 'AIzaSyBloeC6_lUuyPTaIGUooi-El3fmHtkXfCc',
    appId: '1:763155874788:web:72a4a9ba471ded2840fdf1',
    messagingSenderId: '763155874788',
    projectId: 'what-chat-56a95',
    authDomain: 'what-chat-56a95.firebaseapp.com',
    storageBucket: 'what-chat-56a95.appspot.com',
    measurementId: 'G-EPJRN4JB5D',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBNyx3ehqEdv4Zt-BVFiCBg_7oYPGs4UaY',
    appId: '1:763155874788:android:7d1e1ac4a569c2fd40fdf1',
    messagingSenderId: '763155874788',
    projectId: 'what-chat-56a95',
    storageBucket: 'what-chat-56a95.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCIzNrz79IjXsvl9ZBOCUaMbzVt0-SS2-w',
    appId: '1:763155874788:ios:ee2c698f919096e140fdf1',
    messagingSenderId: '763155874788',
    projectId: 'what-chat-56a95',
    storageBucket: 'what-chat-56a95.appspot.com',
    iosClientId: '763155874788-oj6l6qc54lo7f2dp9ee248847cjeorh9.apps.googleusercontent.com',
    iosBundleId: 'com.whatchat.whatchat',
  );
}
