import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final textProvider = StateProvider((ref) => "Hello Riverpod from Provider");

final onPressedProvider = StateProvider((ref) {
  return () {
    print("onPressed default");
  };
});

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textValue = ref.watch(textProvider);
    final onPressedValue = ref.watch(onPressedProvider);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Hello RiverPod")),
        body: Center(
          child: Text(textValue),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: onPressedValue,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
