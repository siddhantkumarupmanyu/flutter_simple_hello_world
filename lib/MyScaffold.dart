import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyScaffold extends ConsumerWidget {
  const MyScaffold({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textValue = ref.watch(textProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Hello RiverPod")),
      body: Center(
        child: Text(textValue),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onPressedValue,
        child: const Icon(Icons.add),
      ),
    );
  }
}

final textProvider = StateProvider((ref) => "Hello Riverpod from Provider");

void defaultFn() {
  print("onPressed default");
}

var onPressedValue = defaultFn;
