import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import 'env/app_config.dart';

/// Bootstraps Firebase and — in the `dev` flavor — wires the Emulator Suite
/// before `runApp`.
///
/// Story 1.1 only installs `firebase_core`. Emulator connections for the other
/// Firebase packages are added in later stories as each package is introduced
/// (`cloud_firestore`, `firebase_auth`, `firebase_storage`, `cloud_functions`).
Future<void> bootstrap(AppConfig config) async {
  await Firebase.initializeApp(options: config.firebaseOptions);

  if (config.isDev) {
    _connectEmulators(config);
  }
}

void _connectEmulators(AppConfig config) {
  // Emulator Suite ports are defined in `firebase.json`:
  //   Firestore 8080, Auth 9099, Storage 9199, Functions 5001.
  //
  // As the corresponding package is added, wire it here, e.g.:
  //   FirebaseFirestore.instance.useFirestoreEmulator(config.emulatorHost, 8080);
  //   FirebaseAuth.instance.useAuthEmulator(config.emulatorHost, 9099);
  //   FirebaseStorage.instance.useStorageEmulator(config.emulatorHost, 9199);
  //   FirebaseFunctions.instance.useFunctionsEmulator(config.emulatorHost, 5001);
  debugPrint(
    'Dev flavor: Firebase Emulator Suite host=${config.emulatorHost} '
    '(per-package wiring is added in later stories).',
  );
}
