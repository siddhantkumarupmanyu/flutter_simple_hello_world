import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("learningTest", (widgetTester) async {
    await widgetTester.pumpWidget(const MaterialApp(
        body: Center(
          child: Text("test"),
    )));

    final test = find.text("test");

    expect(test, findsOneWidget);
  });
}
