import 'package:flutter/material.dart';

/// Root widget for the Notely app.
///
/// Story 1.1 renders a placeholder Home so the app can boot. The router
/// (`go_router` 5-tab bottom nav + workspace drawer) arrives in Story 1.2 and
/// the design system (tokens + Light/Dark theme) in Story 1.3.
class NotelyApp extends StatelessWidget {
  const NotelyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notely',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6366F1)),
        useMaterial3: true,
      ),
      home: const HomePlaceholder(),
    );
  }
}

/// Minimal placeholder so the app can boot; replaced by the real Home screen
/// in later stories.
class HomePlaceholder extends StatelessWidget {
  const HomePlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notely')),
      body: const Center(child: Text('Notely — placeholder Home')),
    );
  }
}
