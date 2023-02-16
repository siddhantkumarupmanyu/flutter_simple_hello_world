import 'package:async/async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_hello_world/InMemoryCountRepository.dart';

void main() {
  late InMemoryCountRepository repo;
  late StreamQueue<int> streamQueue;

  setUp(() {
    repo = InMemoryCountRepository(20);
    streamQueue = StreamQueue<int>(repo.countSteam);
  });

  test("getCount", () async {
    await repo.saveCount(10);
    expect(await repo.getCount(), equals(10));
  });

  test("emitsCount", () async {
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

  // test("getAndUpdate", () async {
  // });
}
