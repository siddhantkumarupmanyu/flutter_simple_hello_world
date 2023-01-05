import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'MyScaffold.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _runsAfterBuild(ref);

    ref.watch(myControllerProvider);

    return const MaterialApp(
      home: MyScaffold(),
    );
  }

  // https://stackoverflow.com/a/72286340
  Future<void> _runsAfterBuild(WidgetRef ref) async {
    await Future(() {}); // <-- Dummy await
    print("build complete");
    ref.read(myControllerProvider).initialize();
  }
}

final myControllerProvider =
    Provider.autoDispose((ref) => MyAppController(ref));

class MyAppController {
  final ProviderRef<MyAppController> ref;
  int count = 0;

  MyAppController(this.ref);

  void initialize() {
    ref.read(onPressedProvider.notifier).state = myAppControllerOnPressed;
  }

  void myAppControllerOnPressed() {
    print("appAppController Override onPressed");
    ref.read(textProvider.notifier).state =
        "setting from myAppController ${count++}";
  }
}
