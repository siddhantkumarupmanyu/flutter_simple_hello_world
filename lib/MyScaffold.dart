import 'package:flutter/material.dart';

class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    // final textValue = ref.watch(textProvider); todo:

    return Scaffold(
      appBar: AppBar(title: const Text("Hello RiverPod")),
      body: Center(
        child: Text("test"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: const Icon(Icons.add),
      ),
    );
  }
}
