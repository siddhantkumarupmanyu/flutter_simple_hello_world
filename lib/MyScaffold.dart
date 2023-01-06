import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    final value = context.watch<MyScaffoldValue>();
    final myScaffoldOnPressed =
        Provider.of<MyScaffoldOnPressed>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: const Text("Hello Provider")),
      body: Center(
        child: Text(value),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: myScaffoldOnPressed,
        child: const Icon(Icons.add),
      ),
    );
  }
}

// typedef won't work as it creates just an alias and not new type
typedef MyScaffoldValue = String;
typedef MyScaffoldOnPressed = void Function();
