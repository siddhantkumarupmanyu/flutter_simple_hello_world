import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:simple_hello_world/widgets/MyScaffold.dart';

void main() {
  testWidgets("learningTest", (widgetTester) async {
    await widgetTester.pumpWidget(MaterialApp(
        home: MultiProvider(
          providers: [
            Provider<MyScaffoldValue>.value(
              value: const MyScaffoldValue("100"),
            ),
            Provider<MyScaffoldOnPressed>.value(
                value: MyScaffoldOnPressed((){})),
          ],
          child: const MyScaffold(),
        )
    ));

    expect(find.text("Hello Provider"), findsOneWidget);

    final test = find.text("100");
    expect(test, findsOneWidget);
  });
}
