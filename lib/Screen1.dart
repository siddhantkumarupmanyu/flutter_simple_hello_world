import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'MyScaffold.dart';

class Screen1 extends StatelessWidget {
  final Screen1Vm screenVm = Screen1Vm();

  Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    // why not create them inside screenVm, and use
    // MyChangeNotifier variable;
    //
    // ChangeNotifierProvider.value(
    //   value: variable,
    //   child: ...
    // )
    // cause anyways they are screenVm's
    // collaborators? this init will be gone.

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

class Screen1Vm {
  late final MyScaffoldValue sv;

  int count = 0;

  void onPressed() {
    count++;
    sv.setText("screenVm1: $count");
  }

  void initSc(MyScaffoldCallback sc) {
    sc.onPressed = onPressed;
  }

  initSv(MyScaffoldValue sv) {
    sv.setText("Test");
    this.sv = sv;
  }
}
