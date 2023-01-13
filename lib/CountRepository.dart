import 'dart:async';

class CountRepository {
  int _count = 0;

  final StreamController<int> _countStreamController = StreamController();

  Stream<int> get countSteam => _countStreamController.stream;

  final int _operationDuration;

  CountRepository(this._operationDuration) {
    _notifyFirstListenerWhenAttachedToCountStream();
  }

  Future<int> getCount() async {
    await _waitForSomeTime();
    return _count;
  }

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
