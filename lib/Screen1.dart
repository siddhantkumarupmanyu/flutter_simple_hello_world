import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'MyScaffold.dart';

class Screen1 extends StatelessWidget {
  late final Screen1Vm _screenVm;

  late BuildContext _buildContext;

  Screen1({super.key}) {
    this._screenVm = Screen1Vm(this._navigateTo);
  }

  @override
  Widget build(BuildContext context) {
    _buildContext = context;
    return MultiProvider(
      providers: [
        StreamProvider<MyScaffoldValue>.value(
          value: _screenVm.myScaffoldValueStream,
          initialData: const MyScaffoldValue("100"),
        ),
        Provider<MyScaffoldOnPressed>.value(
            value: MyScaffoldOnPressed(_screenVm.onPressed)),
      ],
      child: const MyScaffold(),
    );
  }

  void _navigateTo() {
    _buildContext.push("/screen2");
  }
}

class Screen1Vm {
  final void Function() _navigateTo;

  final StreamController<MyScaffoldValue> _myScaffoldValueStreamController =
      StreamController()..add(MyScaffoldValue("initial value"));

  Stream<MyScaffoldValue> get myScaffoldValueStream =>
      _myScaffoldValueStreamController.stream;

  int _count = 0;

  Screen1Vm(this._navigateTo);

  void onPressed() {
    _count++;
    _myScaffoldValueStreamController
        .add(MyScaffoldValue("$_count from screen 1"));
    if (_count > 10) {
      _navigateTo();
    }
  }
}
