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
    apiKey: 'AIzaSyBuoa2Hzvg32A_8KvABKTTkP3xjM00oX9g',
    appId: '1:84687051331:web:f2b54f5af55ba2f69f12f6',
    messagingSenderId: '84687051331',
    projectId: 'digital-mission-358b7',
    authDomain: 'digital-mission-358b7.firebaseapp.com',
    databaseURL: 'https://digital-mission-358b7-default-rtdb.firebaseio.com',
    storageBucket: 'digital-mission-358b7.appspot.com',
    measurementId: 'G-LT54EWHCD6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC2eJzkGh60p-namW8v43_nM3MX3YcE9jA',
    appId: '1:84687051331:android:3c2670386c8f92159f12f6',
    messagingSenderId: '84687051331',
    projectId: 'digital-mission-358b7',
    databaseURL: 'https://digital-mission-358b7-default-rtdb.firebaseio.com',
    storageBucket: 'digital-mission-358b7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAy8JyzO9kwf37m_S4nQEVWCDTPC7l1jss',
    appId: '1:84687051331:ios:2342c04faca367cf9f12f6',
    messagingSenderId: '84687051331',
    projectId: 'digital-mission-358b7',
    databaseURL: 'https://digital-mission-358b7-default-rtdb.firebaseio.com',
    storageBucket: 'digital-mission-358b7.appspot.com',
    iosClientId: '84687051331-0gq3jbjo1ae8outgjcaaf517l5k676gv.apps.googleusercontent.com',
    iosBundleId: 'com.example.mission',
  );
}
