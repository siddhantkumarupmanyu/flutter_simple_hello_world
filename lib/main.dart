import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screens/Screen1.dart';
import 'screens/Screen2.dart';

// next step
// - add a repo or some global stuff in main() and let it be consumed in GoRoute builder,
//    so no need to have/take anything in MyApp
// - add tests.
// - if possible take one step forward by creating and reusing same widget in different contexts.

void main() {
  runApp(const MyApp());
}

GoRouter router() {
  return GoRouter(
    initialLocation: "/screen1",
    routes: [
      GoRoute(path: "/screen1", builder: (context, state) => Screen1()),
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
