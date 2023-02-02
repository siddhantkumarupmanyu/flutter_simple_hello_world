import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    final myScaffoldDto = context.watch<MyScaffoldDto>();

    return Scaffold(
      appBar: AppBar(title: const Text("Hello Provider")),
      body: Center(
        child: Text(myScaffoldDto.value),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: myScaffoldDto.callback,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class MyScaffoldDto {
  final String value;
  final void Function() callback;

  const MyScaffoldDto(this.value, this.callback);
}

// todo: delete
class MyScaffoldValue {
  final String value;

  const MyScaffoldValue(this.value);
}

class MyScaffoldOnPressed {
  final void Function() callback;

  const MyScaffoldOnPressed(this.callback);
}
