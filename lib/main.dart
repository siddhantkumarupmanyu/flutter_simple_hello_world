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
    ref.watch(myControllerProvider);

    return const MaterialApp(
      home: MyScaffold(),
    );
  }
}

final myControllerProvider = Provider((ref) => MyAppController(ref));

class MyAppController {
  final ProviderRef<MyAppController> ref;

  MyAppController(this.ref);

  // ref.read(onPressedProvider.notifier).state = myAppControllerOnPressed;

  void myAppControllerOnPressed(){
    print("appAppController Override onPressed");
  }
}
