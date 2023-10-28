import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyScaffold<T extends MyScaffoldDto> extends StatelessWidget {
  const MyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var myScaffoldDto = context.watch<T>();

    return Scaffold(
      appBar: AppBar(title: Text(myScaffoldDto.appBarValue)),
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

// todo: upgrade
// This requires the 'class-modifiers' language feature to be enabled.
// Try updating your pubspec.yaml to set the minimum SDK constraint to 3.0.0 or higher, and running 'pub get
abstract class MyScaffoldDto {
  abstract final String value;
  abstract final void Function() callback;
  abstract final String appBarValue;
}
