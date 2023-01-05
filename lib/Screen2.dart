import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'MyScaffold.dart';

class Screen2 extends ConsumerWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _runsAfterBuild(ref);

    ref.watch(myControllerProvider2);

    return const MaterialApp(
      home: MyScaffold(),
    );
  }

  // https://stackoverflow.com/a/72286340
  Future<void> _runsAfterBuild(WidgetRef ref) async {
    await Future(() {}); // <-- Dummy await
    print("build complete");
    ref.read(myControllerProvider2).initialize();
  }
}

final myControllerProvider2 =
    Provider.autoDispose((ref) => Screen2Controller(ref));

class Screen2Controller {
  final ProviderRef<Screen2Controller> ref;
  int count = 0;

  Screen2Controller(this.ref);

  void initialize() {
    ref.read(onPressedProvider.notifier).state = myAppControllerOnPressed;
  }

  void myAppControllerOnPressed() {
    print("appAppController2 Override onPressed");
    ref.read(textProvider.notifier).state =
        "set from myAppController2 ${count++}";
  }
}
