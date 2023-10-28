import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spike_state_management/CountRepository.dart';
import 'package:flutter_spike_state_management/screens/screen_1/Screen1.dart';
import 'package:flutter_spike_state_management/screens/screen_1/Screen1Vm.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late FakeCountRepo countRepo;
  late GoRouter goRouter;

  Future<void> setUpScreen(WidgetTester tester) async {
    countRepo = FakeCountRepo();

    var screen1Vm = Screen1Vm(countRepo);
    var screen = Screen1(screen1Vm);

    goRouter = GoRouter(initialLocation: "/test-screen", routes: [
      GoRoute(path: "/test-screen", builder: (context, state) => screen)
    ]);

    runApp(MaterialApp.router(
      title: "test app",
      routerConfig: goRouter,
    ));
    await tester.pumpAndSettle();
  }

  testWidgets("rebuildsWidgetsOnNewValue", (WidgetTester tester) async {
    await setUpScreen(tester);

    expect(find.text("Screen 1"), findsOneWidget);
    expect(find.text("10"), findsOneWidget);

    await countRepo.saveCount(1002);
    await tester.pumpAndSettle();

    expect(find.text("1002"), findsOneWidget);
  });

  testWidgets("incrementsCountOnTap", (WidgetTester tester) async {
    await setUpScreen(tester);

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    await expectLater(find.text("1"), findsOneWidget);
  });

  testWidgets("navigatesToScreen2After10Clicks", (tester) async {
    await setUpScreen(tester);

    for (var i = 0; i < 10; i++) {
      await tester.tap(find.byType(FloatingActionButton));
    }
    await tester.pumpAndSettle();

    final RouteMatch lastMatch = goRouter.routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch ? lastMatch.matches : goRouter.routerDelegate.currentConfiguration;
    final String location = matchList.uri.toString();

    expect(location, equals("/screen2"));
  });
}

class FakeCountRepo extends CountRepository {
  var count = 0;
  final streamController = StreamController<int>();

  @override
  Stream<int> get countSteam => streamController.stream;

  @override
  Future<int> getCount() {
    return Future.value(count);
  }

  @override
  Future<void> saveCount(int count) async {
    this.count = count;
    streamController.add(count);
  }

  @override
  void getAndUpdate(int Function(int value) update) {
    // TODO: implement getAndUpdate
  }
}
