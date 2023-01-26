import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/annotations.dart';
import 'package:simple_hello_world/CountRepository.dart';

@GenerateMocks([CountRepository])
// import "creen1_test.mocks.dart";

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("failing test example", (WidgetTester tester) async {
    // var countRepo = MockCountRepository();
  //   // var screen1Vm = Screen1Vm(countRepo);
  //   // var screen = Screen1();
  //
    expect(2 + 2, equals(5));
  });
}