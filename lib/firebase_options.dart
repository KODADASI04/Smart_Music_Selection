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
    apiKey: 'AIzaSyCK4oFl2b2gMwymsSy8AzaUnr385ywrTJQ',
    appId: '1:23529581496:web:33ca753dc5a1671c493d4d',
    messagingSenderId: '23529581496',
    projectId: 'akilli-muzik-secimi',
    authDomain: 'akilli-muzik-secimi.firebaseapp.com',
    storageBucket: 'akilli-muzik-secimi.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBqLMlrCaDqXC-dccqN9D75NZP5t-R1Sro',
    appId: '1:23529581496:android:dc6533934ea8c955493d4d',
    messagingSenderId: '23529581496',
    projectId: 'akilli-muzik-secimi',
    storageBucket: 'akilli-muzik-secimi.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD8DRZGdG8F6FI0sZy-LboVR6_hZXbI_EY',
    appId: '1:23529581496:ios:a5ad2df87c5b9161493d4d',
    messagingSenderId: '23529581496',
    projectId: 'akilli-muzik-secimi',
    storageBucket: 'akilli-muzik-secimi.appspot.com',
    androidClientId: '23529581496-asmd8bh219om985dj6hd6p4ppub75qra.apps.googleusercontent.com',
    iosClientId: '23529581496-4kbhtp1ln6mcskid9maormub2mf65rkf.apps.googleusercontent.com',
    iosBundleId: 'com.example.smartMusicSelection',
  );
}
