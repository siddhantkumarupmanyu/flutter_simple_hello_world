import 'dart:async';

class CountRepository {
  int _count = 0;

  final StreamController<int> _countStreamController = StreamController();

  Stream<int> get countSteam => _countStreamController.stream;

  final int _saveDuration;

  CountRepository(this._saveDuration) {
    _countStreamController.onListen = (){
      _countStreamController.add(_count);
    };
  }

  // todo: make this return future
  int getCount() {
    return _count;
  }

  Future<void> saveCount(int count) async {
    // await Future.delayed(Duration(milliseconds: _saveDuration));
    _count = count;
    if (_countStreamController.hasListener) {
      _countStreamController.add(_count);
    }
  }
}
