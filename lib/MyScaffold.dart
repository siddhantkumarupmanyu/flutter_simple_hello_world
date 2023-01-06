import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    final value = context.watch<MyScaffoldValue>();
    final myScaffoldOnPressed = Provider.of<MyScaffoldOnPressed>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: const Text("Hello Provider")),
      body: Center(
        child: Text(value.textValue),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: myScaffoldOnPressed,
        child: const Icon(Icons.add),
      ),
    );
  }
}

// can use a stream instead of changeNotifier
class MyScaffoldValue extends ChangeNotifier {
  String _textValue = "";

  String get textValue => _textValue;

  void setText(String value) {
    _textValue = value;
    notifyListeners();
  }
}

typedef MyScaffoldOnPressed = void Function();
