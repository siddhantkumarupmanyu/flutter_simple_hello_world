import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'MyScaffold.dart';
import 'Screen1.dart';

class Screen2 extends ConsumerWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<String>(screen1Navigator, (String? oldState, String newState) {
      context.push(newState);
    });

    ref.watch(myControllerProvider2);

    return const MyScaffold();
  }
}

final myControllerProvider2 =
    Provider.autoDispose((ref) => Screen2Controller(ref));

class Screen2Controller {
  final ProviderRef<Screen2Controller> ref;
  int count = 0;

  Screen2Controller(this.ref) {
    onPressedValue = myAppControllerOnPressed;
  }

  void myAppControllerOnPressed() {
    print("appAppController2 Override onPressed");
    // if (count > 10) {
    //   ref.read(screen1Navigator.notifier).state = "/screen2";
    // }
    ref.read(textProvider.notifier).state =
        "set from myAppController2 ${count++}";
  }
}
