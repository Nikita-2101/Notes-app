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
    apiKey: 'AIzaSyBrNiI0pfTPt2P3To9chdSxg17fIfZ1WsY',
    appId: '1:108859422110:web:74ec138c98b6956761528f',
    messagingSenderId: '108859422110',
    projectId: 'notesapp-d673b',
    authDomain: 'notesapp-d673b.firebaseapp.com',
    storageBucket: 'notesapp-d673b.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCS8H66MaDw-0mrG_vNkx2ngE-ZMHLQeuA',
    appId: '1:108859422110:android:570a1ed9f10f885661528f',
    messagingSenderId: '108859422110',
    projectId: 'notesapp-d673b',
    storageBucket: 'notesapp-d673b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBrurVqnpH4hnPHI6vZMEiW0ua1lD-bkJs',
    appId: '1:108859422110:ios:1dcde6b997b796f461528f',
    messagingSenderId: '108859422110',
    projectId: 'notesapp-d673b',
    storageBucket: 'notesapp-d673b.appspot.com',
    iosBundleId: 'com.example.notesapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBrurVqnpH4hnPHI6vZMEiW0ua1lD-bkJs',
    appId: '1:108859422110:ios:df71fbc0444d6a6d61528f',
    messagingSenderId: '108859422110',
    projectId: 'notesapp-d673b',
    storageBucket: 'notesapp-d673b.appspot.com',
    iosBundleId: 'com.example.notesapp.RunnerTests',
  );
}
