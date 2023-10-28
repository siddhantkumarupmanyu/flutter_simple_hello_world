import 'dart:async';

import 'package:flutter_spike_state_management/CountRepository.dart';

class Screen1Vm {
  final CountRepository _countRepo;
  late Function(String screen) _navigateTo;

  Screen1Vm(this._countRepo);

  Stream<int> get countStream => _countRepo.countSteam;

  void onPressed() {
    _countRepo.getAndUpdate((value) {
      var incremented = value + 1;
      if (value % 15 == 0) {
        _navigateTo("/screen2");
      }
      return incremented;
    });
  }

  void setNavigateTo(void Function(String location) navigateTo) {
    _navigateTo = navigateTo;
  }
}
