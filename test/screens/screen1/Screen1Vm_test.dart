import 'package:async/async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_hello_world/screens/screen_1/Screen1Vm.dart';
import 'package:simple_hello_world/widgets/MyScaffold.dart';

void main() {


  test("myScaffoldValueHas", () async {
    final vm = Screen1Vm(() {
      // no op
    });

    final streamQueue = StreamQueue<MyScaffoldValue>(vm.myScaffoldValueStream);

  });
}
