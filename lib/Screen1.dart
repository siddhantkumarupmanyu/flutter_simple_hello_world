import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'MyScaffold.dart';

class Screen1 extends StatelessWidget {
  final Screen1Vm screenVm = Screen1Vm();

  late BuildContext buildContext;

  Screen1({super.key}) {
    this.screenVm.navigateTo = _navigateTo;
  }

  @override
  Widget build(BuildContext context) {
    buildContext = context;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MyScaffoldValue>.value(value: screenVm.sv),
        Provider<MyScaffoldCallback>.value(value: screenVm.sc),
      ],
      child: const MyScaffold(),
    );
  }

  void _navigateTo() {
    buildContext.push("/screen2");
  }
}

class Screen1Vm {
  late final MyScaffoldValue sv;
  late final MyScaffoldCallback sc;

  late final void Function() navigateTo;

  int count = 0;

  Screen1Vm() {
    this.sc = MyScaffoldCallback();
    this.sv = MyScaffoldValue();
    this.sv.setText("Test");
    this.sc.onPressed = onPressed;
  }

  void onPressed() {
    count++;
    sv.setText("screenVm1: $count");
    if(count > 10){
      navigateTo();
    }
  }
}
