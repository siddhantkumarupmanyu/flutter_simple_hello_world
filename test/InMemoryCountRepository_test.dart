import 'package:async/async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_hello_world/InMemoryCountRepository.dart';

void main() {
  test("savesCount", () async {
    final repo = InMemoryCountRepository(20);

    await repo.saveCount(10);

    expect(await repo.getCount(), equals(10));
  });

  test("emitsCount", () async {
    final repo = InMemoryCountRepository(20);
    final streamQueue = StreamQueue<int>(repo.countSteam);

    // i need to await so that saveCount finishes the operation without putting anything in the steam,
    // so streams onListen logic can be verified
    await repo.saveCount(5);
    // gives the latest value when first listener is attached
    expect(await streamQueue.next, equals(5));

    // not awaiting for it to save
    repo.saveCount(10);
    expect(await streamQueue.next, equals(10));

    repo.saveCount(20);
    expect(await streamQueue.next, equals(20));
  });
}
