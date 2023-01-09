import 'dart:async';

import 'package:simple_hello_world/widgets/MyScaffold.dart';

// Vm stands for view model
// one can also call it a service class, or presentation in mvp
// it connects ui to domain.
// ui only need to know about this class. and not the domain.
// interaction with domain is encapsulated here

class Screen1Vm {
  final void Function() _navigateTo;

  final StreamController<MyScaffoldValue> _myScaffoldValueStreamController =
      StreamController()..add(const MyScaffoldValue("initial value"));

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
