import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("Hello Provider")),
      body: Center(
        child: Text(context.select<MyScaffoldDto, String>(
            (myScaffoldDto) => myScaffoldDto.value)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: context.read<MyScaffoldDto>().callback,
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
