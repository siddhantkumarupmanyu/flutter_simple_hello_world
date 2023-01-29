import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:simple_hello_world/CountRepository.dart';
import 'package:simple_hello_world/screens/screen_1/Screen1.dart';
import 'package:simple_hello_world/screens/screen_1/Screen1Vm.dart';

@GenerateMocks([CountRepository])
import "Screen1_test.mocks.dart";

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("incrementsCountOnTap", (WidgetTester tester) async {
    var countRepo = MockCountRepository();
    var screen1Vm = Screen1Vm(countRepo);
    var screen = Screen1(screen1Vm);

    var streamController = StreamController<int>();
    streamController.add(0);

    // i think fake is much better than a mock here,
    // since i am mocking everything, but let's see.
    when(countRepo.countSteam).thenAnswer((realInvocation) => streamController.stream);
    when(countRepo.getCount()).thenAnswer((realInvocation) => Future.value(10));

    runApp(MaterialApp(home: screen));
    await tester.pumpAndSettle();

    expect(find.text("Hello Provider"), findsOneWidget);
    expect(find.text("0"), findsOneWidget);

    await tester.tap(find.byType(FloatingActionButton));

    verify(countRepo.saveCount(11));
  });

  testWidgets("rebuildsWidgetsOnNewValue", (WidgetTester tester) async {
    var countRepo = MockCountRepository();
    var screen1Vm = Screen1Vm(countRepo);
    var screen = Screen1(screen1Vm);

    var streamController = StreamController<int>();
    streamController.add(0);

    // i think fake is much better than a mock here,
    // since i am mocking everything, but let's see.
    when(countRepo.countSteam).thenAnswer((realInvocation) => streamController.stream);
    when(countRepo.getCount()).thenAnswer((realInvocation) => Future.value(10));

    runApp(MaterialApp(home: screen));
    await tester.pumpAndSettle();

    expect(find.text("Hello Provider"), findsOneWidget);
    expect(find.text("0"), findsOneWidget);

    streamController.add(1002);

    await tester.pumpAndSettle();

    expect(find.text("1002"), findsOneWidget);
  });
}

// todo: consider using fake here.