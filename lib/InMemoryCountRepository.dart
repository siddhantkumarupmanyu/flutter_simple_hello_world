import 'dart:async';

import 'package:flutter_spike_state_management/CountRepository.dart';

class InMemoryCountRepository implements CountRepository {
  int _count = 0;

  final StreamController<int> _countStreamController = StreamController();

  @override
  Stream<int> get countSteam => _countStreamController.stream;

  final int _operationDuration;

  InMemoryCountRepository(this._operationDuration) {
    _notifyFirstListenerWhenAttachedToCountStream();
  }

  @override
  Future<int> getCount() async {
    await _waitForSomeTime();
    return _count;
  }

  @override
  Future<void> saveCount(int count) async {
    await _waitForSomeTime();
    _count = count;
    _notifyStream();
  }

  void _notifyFirstListenerWhenAttachedToCountStream() {
    _countStreamController.onListen = (){
      _countStreamController.add(_count);
    };
  }

  Future<void> _waitForSomeTime() async {
    await Future.delayed(Duration(milliseconds: _operationDuration));
  }

  void _notifyStream() {
    if (_countStreamController.hasListener) {
      _countStreamController.add(_count);
    }
  }
}
