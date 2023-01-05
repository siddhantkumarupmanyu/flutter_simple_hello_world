import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'MyScaffold.dart';

class Screen1 extends ConsumerWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _runsAfterBuild(ref);

    ref.watch(myControllerProvider);

    return const MyScaffold();
  }

  // https://stackoverflow.com/a/72286340
  Future<void> _runsAfterBuild(WidgetRef ref) async {
    await Future(() {}); // <-- Dummy await
    print("build complete");
    ref.read(myControllerProvider).initialize();
  }
}

final myControllerProvider =
    Provider.autoDispose((ref) => Screen1Controller(ref));

class Screen1Controller {
  final ProviderRef<Screen1Controller> ref;
  int count = 0;

  Screen1Controller(this.ref);

  void initialize() {
    ref.read(onPressedProvider.notifier).state = myAppControllerOnPressed;
  }

  void myAppControllerOnPressed() {
    print("appAppController Override onPressed");
    ref.read(textProvider.notifier).state =
        "set from myAppController ${count++}";
  }
}
