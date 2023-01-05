import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    final value = context.watch<MyScaffoldValue>();
    // put listen: false here
    // final callBack = Provider.of<MyScaffoldCallback>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Hello Provider")),
      body: Center(
        child: Text(value.value),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: callBack.onPressed,
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}

class MyScaffoldValue extends ChangeNotifier { // add withChangeNotifier
  String get value {
    throw UnimplementedError();
  }
}

// abstract class MyScaffoldCallback {
//   void onPressed();
// }
