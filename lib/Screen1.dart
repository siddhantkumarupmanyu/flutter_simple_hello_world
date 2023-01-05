import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'MyScaffold.dart';

class Screen1 extends ConsumerWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _runsAfterBuild(ref);

    ref.watch(myControllerProvider);

    ref.listen<String>(screen1Navigator, (String? oldState, String newState) {
      context.push(newState);
    });

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
    if (count > 10) {
      ref.read(screen1Navigator.notifier).state = "/screen2";
    }
    ref.read(textProvider.notifier).state =
        "set from myAppController ${count++}";
  }
}

// can we have single navigator for both screen, like global navigator???
final screen1Navigator = StateProvider((ref) => "/nothing");
