import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:simple_hello_world/widgets/MyScaffold.dart';

void main() {
  Future<StreamController<MyScaffoldDto>> pumpWidgetUsing(
      WidgetTester widgetTester) async {
    StreamController<MyScaffoldDto> streamController =
        StreamController<MyScaffoldDto>();

    await widgetTester.pumpWidget(MaterialApp(
        home: StreamProvider<MyScaffoldDto>.value(
      value: streamController.stream,
      initialData: MyScaffoldDto("100", () {}, "App Bar"),
      child: const MyScaffold(),
    )));

    return streamController;
  }

  testWidgets("updatesBodyText", (widgetTester) async {
    var streamController = await pumpWidgetUsing(widgetTester);
    expect(find.text("App Bar"), findsOneWidget);
    expect(find.text("100"), findsOneWidget);
    streamController.add(MyScaffoldDto("20", () {}, "App Bar"));
    await widgetTester.pumpAndSettle();
    expect(find.text("20"), findsOneWidget);
  });

  testWidgets("callsOnPressed", (widgetTester) async {
    var streamController = await pumpWidgetUsing(widgetTester);

    var isCalled = false;
    streamController.add(MyScaffoldDto("100", () {
      isCalled = true;
    }, "App Bar"));
    await widgetTester.pumpAndSettle();

    await widgetTester.tap(find.byType(FloatingActionButton));
    await widgetTester.pumpAndSettle();
    expect(isCalled, equals(true));
  });

  testWidgets("updatesAppBarText", (widgetTester) async {
    var streamController = await pumpWidgetUsing(widgetTester);
    expect(find.text("App Bar"), findsOneWidget);
    streamController.add(MyScaffoldDto("20", () {}, "Updated App Bar"));
    await widgetTester.pumpAndSettle();
    expect(find.text("Updated App Bar"), findsOneWidget);
  });
}
