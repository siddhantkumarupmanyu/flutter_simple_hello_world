
abstract class CountRepository{
  Future<int> getCount();

  Future<void> saveCount(int count);

  void getAndUpdate(int Function(int value) update);

  Stream<int> get countSteam;
}