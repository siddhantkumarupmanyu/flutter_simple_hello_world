import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:simple_hello_world/widgets/MyScaffold.dart';

void main() {
  testWidgets("watchesForValueChange", (widgetTester) async {
    final streamController = StreamController<MyScaffoldDto>();

    await widgetTester.pumpWidget(MaterialApp(
        home: StreamProvider<MyScaffoldDto>.value(
      value: streamController.stream,
      initialData: MyScaffoldDto("100", () {}),
      child: const MyScaffold(),
    )));

    expect(find.text("Hello Provider"), findsOneWidget);
    expect(find.text("100"), findsOneWidget);

    streamController.add(MyScaffoldDto("20", () {}));

    await widgetTester.pumpAndSettle();

    expect(find.text("20"), findsOneWidget);
  });

  testWidgets("callsOnPressed", (widgetTester) async {
    var isCalled = false;

    await widgetTester.pumpWidget(MaterialApp(
        home: Provider<MyScaffoldDto>.value(
      value: MyScaffoldDto("100", () {
        isCalled = true;
      }),
      child: const MyScaffold(),
    )));

    expect(find.text("Hello Provider"), findsOneWidget);
    expect(find.text("100"), findsOneWidget);

    await widgetTester.tap(find.byType(FloatingActionButton));

    await widgetTester.pumpAndSettle();

    expect(isCalled, equals(true));
  });
}
