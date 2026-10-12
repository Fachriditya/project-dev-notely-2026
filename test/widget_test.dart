import 'package:flutter_test/flutter_test.dart';
import 'package:notely/app/app.dart';

void main() {
  testWidgets('Notely app boots and renders placeholder Home', (tester) async {
    await tester.pumpWidget(const NotelyApp());

    // AppBar brand title.
    expect(find.text('Notely'), findsOneWidget);
    // Placeholder Home body (Story 1.1 boot target).
    expect(find.text('Notely — placeholder Home'), findsOneWidget);
  });
}
