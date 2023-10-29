import 'package:async/async.dart';
import 'package:flutter_spike_state_management/InMemoryCountRepository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late InMemoryCountRepository repo;
  late StreamQueue<int> streamQueue;

  setUp(() {
    repo = InMemoryCountRepository(200);
    streamQueue = StreamQueue<int>(repo.countSteam);
  });

  test("getCount", () async {
    await repo.saveCount(10);
    expect(await repo.getCount(), equals(10));
  });

  test("emitsCount", () async {
    await repo.saveCount(5);
    expect(await streamQueue.next, equals(5));

    repo.saveCount(10);
    expect(await streamQueue.next, equals(10));

    repo.saveCount(20);
    expect(await streamQueue.next, equals(20));
  });

  test("getAndUpdate", () async {
    repo.getAndUpdate((value) => value + 1);
    repo.getAndUpdate((value) => value + 3);

    expect(await streamQueue.next, equals(2));
    expect(await streamQueue.next, equals(5));
  });

  test("multipleListeners", () async {
    await repo.saveCount(5);
    expect(await streamQueue.next, equals(5));

    final streamQueue2 = StreamQueue<int>(repo.countSteam);

    await repo.saveCount(10);

    expect(await streamQueue2.next, equals(10));
    expect(await streamQueue.next, equals(10));
  });
}
