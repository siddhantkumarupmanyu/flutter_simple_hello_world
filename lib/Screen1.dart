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
        StreamProvider<MyScaffoldValue>.value(
          value: screenVm.testSteam,
          initialData: const MyScaffoldValue("100"),
        ),
        StreamProvider<String>.value(
          value: screenVm.stringSteam,
          initialData: '10',
        ),
        Provider<MyScaffoldOnPressed>.value(
            // should i put it inside my vm
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
  late final void Function() navigateTo;

  Stream<MyScaffoldValue> get testSteam async* {
    var i = 0;
    while (i < 85) {
      await Future.delayed(const Duration(seconds: 2), () {
        i++;
      });
      yield MyScaffoldValue(i.toString());
    }
  }

  Stream<String> get stringSteam async* {
    var i = 0;
    while (i < 85) {
      await Future.delayed(const Duration(seconds: 2), () {
        i++;
      });
      yield i.toString();
    }
  }

  int _count = 0;

  Screen1Vm();

  // MyScaffoldOnPressed scaffoldCallback = MyScaffoldOnPressed((){
  //   print("test");
  // });

  void onPressed() {
    // todo:
    // count++;
    // sv.setText("screenVm1: $count");
    // if (count > 10) {
    //   navigateTo();
    // }
  }
}
