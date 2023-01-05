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
        ChangeNotifierProvider(create: (context){
          final sv = MyScaffoldValue();
          screenVm.setSv(sv);
          return sv;
        })
      ],
      child: const MyScaffold(),
    );
  }
}

class Screen1Vm {

  late final MyScaffoldValue sv;

  setSv(MyScaffoldValue sv){
    sv.setText("Test");
    this.sv = sv;
  }

  @override
  void onPressed() {
    print("sceenvm1 called");
  }
}
