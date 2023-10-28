import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_spike_state_management/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("navigatesToScreen2After10Clicks", (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    expect(find.text("Screen 1"), findsOneWidget);
    expect(find.text("0"), findsOneWidget);

    for (var i = 0; i < 10; i++) {
      await tester.tap(find.byType(FloatingActionButton));
    }

    expect(find.text("Screen 2"), findsOneWidget);
  });
}
