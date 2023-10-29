import 'dart:async';

import 'package:flutter_spike_state_management/CountRepository.dart';

class InMemoryCountRepository implements CountRepository {
  int _count = 1;

  final StreamController<int> _countStreamController = StreamController.broadcast();

  @override
  Stream<int> get countSteam => _countStreamController.stream;

  final int _operationDuration;

  InMemoryCountRepository(this._operationDuration);

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

  // https://www.reddit.com/r/dartlang/s/NayG3dPRaB
  var _updatePendingTask = Future.value();

  @override
  void getAndUpdate(int Function(int value) update) {
    var thisTask = _updatePendingTask.then((_) async {
      final count = await getCount();
      final updated = update(count);
      await saveCount(updated);
    });
    _updatePendingTask = thisTask;
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
