import 'package:async/async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:simple_hello_world/CountRepository.dart';
import 'package:simple_hello_world/screens/screen_1/Screen1Vm.dart';

@GenerateMocks([CountRepository])
import "Screen1Vm_test.mocks.dart";

void main() {
  // test("exposesCountStream", () async {
  //   final vm = Screen1Vm();
  //
  //   final streamQueue = StreamQueue<int>(vm.countStream);
  //
  //   expect(await streamQueue.next, equals(20));
  // });

  test("incrementsCountOnPress", () {
    // final vm = Screen1Vm();

    final countRepo = MockCountRepository();

  });
}
