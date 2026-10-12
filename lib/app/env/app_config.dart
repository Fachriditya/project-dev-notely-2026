import 'package:firebase_core/firebase_core.dart';

import '../../firebase_options_dev.dart' as dev;
import '../../firebase_options_prod.dart' as prod;

/// Application flavor: `dev` (Firebase Emulator Suite + `notely-dev`) or
/// `prod` (live `notely-prod`).
enum AppFlavor { dev, prod }

/// Immutable runtime configuration resolved from compile-time `--dart-define`
/// values.
///
/// Secrets must never flow through here — only client-safe, public values
/// (flavor name, emulator endpoint, Firebase client options). Firebase client
/// options are not secrets; Gemini/OAuth secrets live only in Cloud Functions.
class AppConfig {
  const AppConfig({
    required this.flavor,
    required this.firebaseOptions,
    required this.emulatorHost,
  });

  final AppFlavor flavor;
  final FirebaseOptions firebaseOptions;

  /// Host used to reach the Firebase Emulator Suite from the running app.
  ///
  /// On an Android emulator the host machine is reachable via `10.0.2.2`; on
  /// desktop/web it is `localhost`. Overridable via `--dart-define=EMULATOR_HOST`.
  final String emulatorHost;

  bool get isDev => flavor == AppFlavor.dev;
  bool get isProd => flavor == AppFlavor.prod;

  /// Resolves configuration from `--dart-define=FLAVOR=dev|prod`.
  factory AppConfig.fromEnvironment() {
    const flavorName = String.fromEnvironment('FLAVOR', defaultValue: 'dev');
    const emulatorHost = String.fromEnvironment(
      'EMULATOR_HOST',
      defaultValue: '10.0.2.2',
    );

    switch (flavorName) {
      case 'prod':
        return AppConfig(
          flavor: AppFlavor.prod,
          firebaseOptions: prod.DefaultFirebaseOptions.currentPlatform,
          emulatorHost: emulatorHost,
        );
      case 'dev':
      default:
        return AppConfig(
          flavor: AppFlavor.dev,
          firebaseOptions: dev.DefaultFirebaseOptions.currentPlatform,
          emulatorHost: emulatorHost,
        );
    }
  }
}
