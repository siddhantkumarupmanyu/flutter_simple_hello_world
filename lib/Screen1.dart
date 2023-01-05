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
    });

    ref.watch(myControllerProvider);

    return const MyScaffold();
  }
}

final myControllerProvider =
    StateProvider.autoDispose((ref) => Screen1Controller(ref));

class Screen1Controller {
  final Ref ref;
  int count = 0;

  Screen1Controller(this.ref){
    onPressedValue = myAppControllerOnPressed;
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
