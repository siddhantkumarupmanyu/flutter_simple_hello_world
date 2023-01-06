import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    final myScaffoldValue = context.watch<MyScaffoldValue>();
    final myScaffoldOnPressed =
        Provider.of<MyScaffoldOnPressed>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: const Text("Hello Provider")),
      body: Center(
        child: Text(myScaffoldValue.value),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: myScaffoldOnPressed.callback,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class MyScaffoldValue{
  final String value;
  const MyScaffoldValue(this.value);
}

class MyScaffoldOnPressed{
  final void Function() callback;
  const MyScaffoldOnPressed(this.callback);
}

// these are immutable classes just wrapping the concrete type. DTOs.
// this is done so provider can detect correct type.
// cause typedef does not work

// one can go and club these two and then,
// have MyScaffoldValue take stream and all that stuff.
// and listen particular stuff
// but i want to keep it simple and provide a direct replacement for wrapped types.
