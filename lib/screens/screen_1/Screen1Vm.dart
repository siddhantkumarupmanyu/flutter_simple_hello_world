import 'dart:async';

import 'package:flutter_spike_state_management/CountRepository.dart';

// Vm stands for view model
// one can also call it a service class, or presentation in mvp
// it connects ui to domain.
// ui only need to know about this class. and not the domain.
// interaction with domain is encapsulated here

class Screen1Vm {
  final CountRepository _countRepo;
  late Function(String screen) _navigateTo;

  Screen1Vm(this._countRepo);

  Stream<int> get countStream => _countRepo.countSteam;

  // todo:
  // one issue is when saveCount is still in progress,
  // we are getting old value from getCount,
  // its such a threading issue,
  // i am doing something wrong here??
  // show i put write lock.
  // while a write operation in going on wait for read as well as write.
  // issue here is i don't want to overwrite i want to get old value
  // and then update, in such cases we can have getAndUpdate()
  // on in this case get not required.

  // use getAndUpdate and under async fn launch _navigateTo
  // so getAndUpdateExecution completes successfully and _navigateTo
  // is put up as different event in event loop.
  void onPressed() {
    final count = _countRepo.getCount();
    count.then((value) {
      _countRepo.saveCount(value + 1);
      if (value == 10) {
        _navigateTo("/screen2");
      }
    });
  }

  void setNavigateTo(void Function(String location) navigateTo) {
    _navigateTo = navigateTo;
  }
}
