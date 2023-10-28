import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spike_state_management/widgets/MyScaffold.dart';

class TestScaffoldDto implements MyScaffoldDto {
  TestScaffoldDto(this.appBarValue, this.callback, this.value);

  @override
  final String appBarValue;

  @override
  final void Function() callback;

  @override
  final String value;
}

void main() {
  Future<StreamController<MyScaffoldDto>> pumpWidgetUsing(
      WidgetTester widgetTester) async {
    StreamController<MyScaffoldDto> streamController =
        StreamController<MyScaffoldDto>();

    await widgetTester.pumpWidget(MaterialApp(
        home: StreamProvider<MyScaffoldDto>.value(
      value: streamController.stream,
      initialData: TestScaffoldDto("100", () {}, "App Bar"),
      child: const MyScaffold(),
    )));
    var foo = const MyScaffold();
    print(foo); // Instance of 'Foo<SomeBaseClass>'

    return streamController;
  }

  testWidgets("updatesBodyText", (widgetTester) async {
    var streamController = await pumpWidgetUsing(widgetTester);
    expect(find.text("App Bar"), findsOneWidget);
    expect(find.text("100"), findsOneWidget);
    streamController.add(TestScaffoldDto("20", () {}, "App Bar"));
    await widgetTester.pumpAndSettle();
    expect(find.text("20"), findsOneWidget);
  });

  testWidgets("callsOnPressed", (widgetTester) async {
    var streamController = await pumpWidgetUsing(widgetTester);

    var isCalled = false;
    streamController.add(TestScaffoldDto("100", () {
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
    streamController.add(TestScaffoldDto("20", () {}, "Updated App Bar"));
    await widgetTester.pumpAndSettle();
    expect(find.text("Updated App Bar"), findsOneWidget);
  });
}
