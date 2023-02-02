import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screens/screen_1/Screen1.dart';
import 'screens/screen_2/Screen2.dart';


void main() {
  runApp(const MyApp());
}

GoRouter router() {
  return GoRouter(
    initialLocation: "/screen2",
    routes: [
      // todo:
      // GoRoute(path: "/screen1", builder: (context, state) => Screen1()),
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
