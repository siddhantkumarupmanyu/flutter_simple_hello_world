import 'dart:async';

class CountRepository {
  int _count = 0;

  final StreamController<int> _countStreamController = StreamController();

  Stream<int> get countSteam => _countStreamController.stream;

  final int _operationDuration;

  CountRepository(this._operationDuration) {
    _countStreamController.onListen = (){
      _countStreamController.add(_count);
    };
  }

  Future<int> getCount() async {
    await Future.delayed(Duration(milliseconds: _operationDuration));
    return _count;
  }

  Future<void> saveCount(int count) async {
    await Future.delayed(Duration(milliseconds: _operationDuration));
    _count = count;
    if (_countStreamController.hasListener) {
      _countStreamController.add(_count);
    }
  }
}
