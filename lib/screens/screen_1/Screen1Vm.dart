import 'dart:async';

import 'package:simple_hello_world/CountRepository.dart';
import 'package:simple_hello_world/widgets/MyScaffold.dart';

// Vm stands for view model
// one can also call it a service class, or presentation in mvp
// it connects ui to domain.
// ui only need to know about this class. and not the domain.
// interaction with domain is encapsulated here

class Screen1VmOld {
  final void Function() _navigateTo;

  final StreamController<MyScaffoldValue> _myScaffoldValueStreamController =
      StreamController();
        // ..add(const MyScaffoldValue("initial value"));

  Stream<MyScaffoldValue> get myScaffoldValueStream =>
      _myScaffoldValueStreamController.stream;

  Screen1VmOld(this._navigateTo);

  void onPressed() {
  }
}

class Screen1Vm {

  final CountRepository _countRepo;

  Screen1Vm(this._countRepo);


  void onPressed() {
    final count = _countRepo.getCount();
    count.then((value) {
      _countRepo.saveCount(value + 1);
    });
  }

}
