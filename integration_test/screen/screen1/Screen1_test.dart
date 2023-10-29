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
    expect(find.text("36"), findsOneWidget);

    countRepo.getAndUpdate((_) => 1002);
    await tester.pumpAndSettle();

    expect(find.text("1002"), findsOneWidget);
  });

  testWidgets("incrementsCountOnTap", (WidgetTester tester) async {
    await setUpScreen(tester);

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    await expectLater(find.text("2"), findsOneWidget);
  });

  testWidgets("navigatesToScreen2After15Clicks", (tester) async {
    await setUpScreen(tester);

    for (var i = 0; i < 15; i++) {
      await tester.tap(find.byType(FloatingActionButton));
    }
    await tester.pumpAndSettle();

    final RouteMatch lastMatch =
        goRouter.routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : goRouter.routerDelegate.currentConfiguration;
    final String location = matchList.uri.toString();

    expect(location, equals("/screen2"));
  });
}

class FakeCountRepo extends CountRepository {
  var count = 1;
  final streamController = StreamController<int>();

  @override
  Stream<int> get countSteam => streamController.stream;

  @override
  Future<int> getCount() {
    // no impl.
    throw UnimplementedError();
  }

  @override
  Future<void> saveCount(int count) async {
    // no impl.
    throw UnimplementedError();
  }

  @override
  void getAndUpdate(int Function(int value) update) {
    count = update(count);
    streamController.add(count);
  }
}
