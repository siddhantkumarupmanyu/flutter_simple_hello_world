import 'package:flutter_test/flutter_test.dart';
import 'package:simple_hello_world/CountRepository.dart';

void main() {
  test("savesCount", () async {
    final repo = CountRepository(100);

    await repo.saveCount(10);

    expect(repo.getCount(), equals(10));
  });

  test("emitsCount", () async {
    final repo = CountRepository(100);

    repo.saveCount(10);

    expect(repo.countSteam, emitsInOrder([10, 20]));

    repo.saveCount(20);
  });
}
