

class CountRepository{

  int _count = 0;



  int getCount() {
    return _count;
  }

  Future<void> saveCount(int count) async{
    // add some delay
    _count = count;
  }

}