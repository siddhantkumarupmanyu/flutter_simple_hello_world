import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_spike_state_management/CountRepository.dart';
import 'package:flutter_spike_state_management/InMemoryCountRepository.dart';
import 'package:flutter_spike_state_management/screens/screen_1/Screen1Vm.dart';

import 'screens/screen_1/Screen1.dart';
import 'screens/screen_2/Screen2.dart';

void main() {
  runApp(const MyApp());
}

GoRouter router() {
  CountRepository countRepo = InMemoryCountRepository(200);

  return GoRouter(
    initialLocation: "/screen1",
    routes: [
      GoRoute(
          path: "/screen1",
          builder: (context, state) {
            var vm = Screen1Vm(countRepo);
            return Screen1(vm);
          }),
      GoRoute(path: "/screen2", builder: (context, state) => Screen2())
    ],
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Is this good???",
      routerConfig: router(),
    );
  }
}
