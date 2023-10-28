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

@immutable
abstract interface class MyScaffoldDto {
  abstract final String value;
  abstract final void Function() callback;
  abstract final String appBarValue;
}

// multiple optimizations can be done.
// like why passing callback everytime.
// create value type and only watch that.
// watch separately and what not
// all those optimization can be done.
// what this eg. shows is with generics same widget should be able to listen/watch
// for different data changes.
// since provider works with types have to be done/this can be done like this.