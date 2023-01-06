

class CountRepository{

  int _count = 0;



  int getCount() {
    return _count;
  }

  Future<void> saveCount(int count) async{
    await Future.delayed(const Duration(seconds: 2));
    _count = count;
  }

}