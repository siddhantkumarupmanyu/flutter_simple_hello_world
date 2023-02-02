import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:simple_hello_world/widgets/MyScaffold.dart';

import 'Screen1Vm.dart';

class Screen1 extends StatelessWidget {
  late final Screen1Vm _screenVm;

  Screen1(Screen1Vm screen1vm, {super.key}) {
    this._screenVm = screen1vm;
  }

  @override
  Widget build(BuildContext context) {
    // _buildContext = context;
    return MultiProvider(
      providers: [
        StreamProvider<MyScaffoldValue>.value(
          value: _screenVm.countStream
              .map((event) => MyScaffoldValue(event.toString())),
          initialData: const MyScaffoldValue("-1"),
        ),
        Provider<MyScaffoldOnPressed>.value(
            value: MyScaffoldOnPressed(_screenVm.onPressed)),
      ],
      child: const MyScaffold(),
    );
  }

  void _navigateTo() {
    // _buildContext.push("/screen2");
  }
}
