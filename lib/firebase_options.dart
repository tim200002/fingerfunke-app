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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC65YngU2ErAP6Qv_VZa6Yt8KL7mZG9Q94',
    appId: '1:1000452508229:android:0ff504129289a5f786b12c',
    messagingSenderId: '1000452508229',
    projectId: 'fingerfunke',
    storageBucket: 'fingerfunke.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyABzmLxfmFRISR1K8J3iLsI8l4OSZXpKIE',
    appId: '1:1000452508229:ios:1dc3b98fe35ccee786b12c',
    messagingSenderId: '1000452508229',
    projectId: 'fingerfunke',
    storageBucket: 'fingerfunke.appspot.com',
    androidClientId: '1000452508229-2if0vmnj1rhaad6k9jrfd8fhp71flbsq.apps.googleusercontent.com',
    iosClientId: '1000452508229-acqe4ksdcc0t0f40eradlb03oajantq9.apps.googleusercontent.com',
    iosBundleId: 'app.fingerfunke.fingerfunke-mobile-app',
  );
}
