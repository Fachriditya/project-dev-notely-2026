// NOTE: PLACEHOLDER STUB — do not use in any real environment.
//
// This file is a compile-valid stub so the project builds before the real
// `notely-prod` Firebase project is provisioned. Regenerate it once the project
// exists and FlutterFire CLI is configured:
//
//   dart pub global activate flutterfire_cli
//   flutterfire configure \
//     --project=notely-prod \
//     --platforms=android,ios \
//     --out=lib/firebase_options_prod.dart
//
// Firebase client options are client-safe (NOT secrets); the values below are
// intentionally non-functional placeholders that must be replaced before the
// app can connect to any Firebase backend.

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for the `notely-prod` project.
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

  // PLACEHOLDER values — regenerate via `flutterfire configure` (see header).
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIza-PLACEHOLDER-notely-prod',
    appId: '1:000000000000:android:0000000000000000000000',
    messagingSenderId: '000000000000',
    projectId: 'notely-prod',
    storageBucket: 'notely-prod.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIza-PLACEHOLDER-notely-prod',
    appId: '1:000000000000:ios:0000000000000000000000',
    messagingSenderId: '000000000000',
    projectId: 'notely-prod',
    storageBucket: 'notely-prod.appspot.com',
    iosBundleId: 'app.notely.notely',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIza-PLACEHOLDER-notely-prod',
    appId: '1:000000000000:web:0000000000000000000000',
    messagingSenderId: '000000000000',
    projectId: 'notely-prod',
    storageBucket: 'notely-prod.appspot.com',
  );
}
