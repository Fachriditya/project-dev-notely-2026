import 'package:flutter/material.dart';

import 'app.dart';
import 'bootstrap.dart';
import 'env/app_config.dart';

/// Entrypoint. Initializes Firebase (and, in dev, the Emulator Suite) before
/// mounting the root widget.
///
/// Run with a flavor:
///   flutter run -t lib/app/main.dart --dart-define=FLAVOR=dev
///   flutter run -t lib/app/main.dart --dart-define=FLAVOR=prod
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final config = AppConfig.fromEnvironment();
  await bootstrap(config);
  runApp(const NotelyApp());
}
