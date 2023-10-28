import 'dart:async';

import 'package:async/async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_spike_state_management/CountRepository.dart';
import 'package:flutter_spike_state_management/screens/screen_1/Screen1Vm.dart';

@GenerateMocks([CountRepository])
import "Screen1Vm_test.mocks.dart";

void main() {
  late CountRepository countRepo;
  late Screen1Vm vm;

  setUp(() {
    countRepo = MockCountRepository();
    vm = Screen1Vm(countRepo);
  });

  test("adds1OnPressed", () async {
    when(countRepo.getCount()).thenAnswer((_) => Future.value(11));

    vm.onPressed();

    await Future.delayed(const Duration(milliseconds: 1));
    verify(countRepo.saveCount(12));
  });

  test("exposesCountStream", () async {
    final streamController = StreamController<int>();
    when(countRepo.countSteam).thenAnswer((_) => streamController.stream);

    final streamQueue = StreamQueue<int>(vm.countStream);

    streamController.add(22);

    expect(await streamQueue.next, equals(22));
  });

  /*
    vm.navigateTo = () {

    }
    OR
    vm.setNavigateTo((){

    })
    */
  test("navigatesToScreen2WhenCountEquals10", () async {
    when(countRepo.getCount()).thenAnswer((_) => Future.value(10));

    vm.onPressed();

    var pushedLocation = "";
    vm.setNavigateTo((location) {
      pushedLocation = location;
    });

    await Future.delayed(const Duration(milliseconds: 1));
    verify(countRepo.saveCount(11));

    expect(pushedLocation, equals("/screen2"));
  });
}
