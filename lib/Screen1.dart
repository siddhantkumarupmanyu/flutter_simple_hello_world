import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'MyScaffold.dart';

class Screen1 extends ConsumerWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<String>(screen1Navigator, (String? oldState, String newState) {
      context.push(newState);
      // why is new instance not getting created when i again come to this screen.
      ref.read(myControllerProvider.notifier).dispose();
    });

    _runsAfterBuild(ref);
    ref.watch(myControllerProvider);
    return const MyScaffold();
  }

  // https://stackoverflow.com/a/72286340
  Future<void> _runsAfterBuild(WidgetRef ref) async {
    await Future(() {}); // <-- Dummy await
    print("build complete");
    if (GoRouter.of(ref.context).location == "/screen1") {
      ref.read(myControllerProvider).initialize();
    }
  }
}

final myControllerProvider =
    StateProvider.autoDispose((ref) => Screen1Controller(ref));

class Screen1Controller {
  final Ref ref;
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
final screen1Navigator = StateProvider((ref) => "/screen1");
