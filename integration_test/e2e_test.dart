import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:simple_hello_world/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("navigatesToScreen2After10Clicks", (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    expect(find.text("Screen 1"), findsOneWidget);
    expect(find.text("0"), findsOneWidget);

    await tester.tap(find.byType(FloatingActionButton));
  });
}
