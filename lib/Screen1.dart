import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'MyScaffold.dart';

class Screen1 extends StatelessWidget {
  final Screen1Vm screenVm = Screen1Vm();

  Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MyScaffoldValue>(create: (context) {
          final sv = MyScaffoldValue();
          screenVm.setSv(sv);
          return sv;
        }),
        Provider<MyScaffoldCallback>(create: (context) {
          final sc = MyScaffoldCallback();
          sc.onPressed = screenVm.onPressed;
          return sc;
        }),
      ],
      child: const MyScaffold(),
    );
  }
}

class Screen1Vm {
  late final MyScaffoldValue sv;

  int count = 0;

  setSv(MyScaffoldValue sv) {
    sv.setText("Test");
    this.sv = sv;
  }

  void onPressed() {
    count++;
    sv.setText("screenVm1: $count");
  }
}
