import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'MyScaffold.dart';

class Screen1 extends StatelessWidget {
  late final Screen1Vm screenVm;

  late BuildContext buildContext;

  Screen1({super.key}){
    this.screenVm = Screen1Vm(this._navigateTo);
  }

  @override
  Widget build(BuildContext context) {
    buildContext = context;
    return MultiProvider(
      providers: [
        StreamProvider<MyScaffoldValue>.value(
          value: screenVm.testSteam,
          initialData: const MyScaffoldValue("100"),
        ),
        Provider<MyScaffoldOnPressed>.value(
            value: MyScaffoldOnPressed(screenVm.onPressed)),
      ],
      child: const MyScaffold(),
    );
  }

  void _navigateTo() {
    buildContext.push("/screen2");
  }
}

class Screen1Vm {
  final void Function() navigateTo;

  Stream<MyScaffoldValue> get testSteam async* {
    var i = 0;
    while (i < 85) {
      await Future.delayed(const Duration(seconds: 2), () {
        i++;
      });
      yield MyScaffoldValue(i.toString());
    }
  }

  int _count = 0;

  Screen1Vm(this.navigateTo);

  void onPressed() {
    // todo:
    // _count++;
    // sv.setText("screenVm1: $count");
    // if (count > 10) {
    //   navigateTo();
    // }
  }
}
