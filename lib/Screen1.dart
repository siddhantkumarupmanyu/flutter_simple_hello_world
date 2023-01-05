import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'MyScaffold.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Screen1Vm>(create: (context) => Screen1Vm()),
        ChangeNotifierProxyProvider<Screen1Vm, MyScaffoldValue>(
            create: (context) => MyScaffoldValue(),
            update: (_, screen1Vm, sV) => screen1Vm),
        // ProxyProvider<Screen1Vm, MyScaffoldCallback>(
        //     update: (_, screen1Vm, sC) => screen1Vm),
      ],
      child: const MyScaffold(),
    );
  }
}

class Screen1Vm extends ChangeNotifier implements MyScaffoldValue {
  @override
  String get value => "from Screen1Vm";

  @override
  void onPressed() {
    print("sceenvm1 called");
  }
}
