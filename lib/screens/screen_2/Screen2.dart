import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_hello_world/widgets/MyScaffold.dart';



class Screen2 extends StatelessWidget {
  final Screen2Vm _screenVm = Screen2Vm();

  Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<MyScaffoldValue>.value(
          value: _screenVm.myScaffoldValueStream,
          initialData: const MyScaffoldValue("0"),
        ),
        Provider<MyScaffoldOnPressed>.value(
            value: MyScaffoldOnPressed(_screenVm.onPressed)),
      ],
      child: const MyScaffold(),
    );
  }
}

class Screen2Vm {
  final StreamController<MyScaffoldValue> _myScaffoldValueStreamController =
      StreamController()..add(MyScaffoldValue("initial value, screen 2"));

  Stream<MyScaffoldValue> get myScaffoldValueStream =>
      _myScaffoldValueStreamController.stream;

  int _count = 0;

  Screen2Vm();

  void onPressed() {
    _count++;
    _myScaffoldValueStreamController
        .add(MyScaffoldValue("$_count from screen 2"));
  }
}
