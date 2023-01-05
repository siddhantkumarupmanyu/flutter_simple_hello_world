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
        ChangeNotifierProvider<MyScaffoldValue>(create: (context) {
          final sv = MyScaffoldValue();
          screenVm.initSv(sv);
          return sv;
        }),
        Provider<MyScaffoldCallback>(create: (context) {
          final sc = MyScaffoldCallback();
          screenVm.initSc(sc);
          return sc;
        }),
      ],
      child: const MyScaffold(),
    );
  }
}

class Screen2Vm {
  late final MyScaffoldValue sv;

  int count = 0;

  void onPressed() {
    count++;
    sv.setText("screenVm2: $count");
  }

  void initSc(MyScaffoldCallback sc) {
    sc.onPressed = onPressed;
  }

  initSv(MyScaffoldValue sv) {
    sv.setText("Test Screen2");
    this.sv = sv;
  }
}
