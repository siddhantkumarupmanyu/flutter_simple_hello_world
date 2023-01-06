import 'package:flutter_test/flutter_test.dart';
import 'package:simple_hello_world/CountRepository.dart';

import 'package:async/async.dart';


void main() {
  test("savesCount", () async {
    final repo = CountRepository(100);

    await repo.saveCount(10);

    expect(repo.getCount(), equals(10));
  });

  test("emitsCount", () async {
    final repo = CountRepository(100);
    final streamQueue = StreamQueue<int>(repo.countSteam);

    // not awaiting for it to save
    repo.saveCount(10);
    expect(await streamQueue.next, equals(10));

    repo.saveCount(20);
    expect(await streamQueue.next, equals(20));
  });
}
