import 'package:flutter/material.dart';
import 'package:flutter_spike_state_management/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("navigatesToScreen2After15Clicks", (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    expect(find.text("Screen 1"), findsOneWidget);
    expect(find.text("36"), findsOneWidget);

    for (var i = 0; i < 15; i++) {
      await tester.tap(find.byType(FloatingActionButton));
    }

    await tester.pumpAndSettle();
    await Future.delayed(const Duration(seconds: 8));
    await tester.pumpAndSettle();
    expect(find.text("Screen 2"), findsOneWidget);
  });
}
