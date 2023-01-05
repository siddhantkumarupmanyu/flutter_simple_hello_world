import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'MyScaffold.dart';

class Screen2 extends StatelessWidget {
  final Screen2Vm screenVm = Screen2Vm();

  Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MyScaffoldValue>.value(value: screenVm.sv),
        Provider<MyScaffoldCallback>.value(value: screenVm.sc),
      ],
      child: const MyScaffold(),
    );
  }
}

class Screen2Vm {
  late final MyScaffoldValue sv;
  late final MyScaffoldCallback sc;

  int count = 0;

  Screen2Vm() {
    this.sc = MyScaffoldCallback();
    this.sv = MyScaffoldValue();
    this.sv.setText("Test");
    this.sc.onPressed = onPressed;
  }

  void onPressed() {
    count++;
    sv.setText("screenVm2: $count");
  }
}
