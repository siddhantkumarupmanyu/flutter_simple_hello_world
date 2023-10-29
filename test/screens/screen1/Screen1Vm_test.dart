import 'dart:async';

import 'package:async/async.dart';
import 'package:flutter_spike_state_management/CountRepository.dart';
import 'package:flutter_spike_state_management/screens/screen_1/Screen1Vm.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([CountRepository])
import "Screen1Vm_test.mocks.dart";

void main() {
  late MockCountRepository countRepo;
  late Screen1Vm vm;

  setUp(() {
    countRepo = MockCountRepository();
    vm = Screen1Vm(countRepo);
  });

  test("exposesCountStream", () async {
    final streamController = StreamController<int>();
    when(countRepo.countSteam).thenAnswer((_) => streamController.stream);

    final streamQueue = StreamQueue<int>(vm.countStream);

    streamController.add(22);

    expect(await streamQueue.next, equals(22));
  });

  test("incrementsValueBy1", () async {
    vm.onPressed();

    int Function(int) lambda =
        verify(countRepo.getAndUpdate(captureAny)).captured[0];
    expect(lambda(4), equals(5));
  });

  /*
    vm.navigateTo = () {

    }
    OR
    vm.setNavigateTo((){

    })
    */
  test("navigatesToScreen2OnModulus15", () async {
    var location = "";
    vm.setNavigateTo((l) {
      location = l;
    });

    vm.onPressed();

    int Function(int) lambda =
        verify(countRepo.getAndUpdate(captureAny)).captured[0];
    lambda(10);
    expect(location, equals(""));
    lambda(15);
    expect(location, equals("/screen2"));
  });
}
