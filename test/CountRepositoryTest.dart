
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_hello_world/CountRepository.dart';

void main(){

  test("savesCount", (){
    final repo = CountRepository();

    repo.saveCount(10);

    expect(repo.getCount(), equals(10));
  });

}