import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:simple_hello_world/widgets/MyScaffold.dart';

import 'Screen1Vm.dart';

class Screen1 extends StatelessWidget {
  late final Screen1Vm _screenVm;

  late BuildContext _buildContext;

  Screen1({super.key}) {
    this._screenVm = Screen1Vm(this._navigateTo);
  }

  @override
  Widget build(BuildContext context) {
    _buildContext = context;
    return MultiProvider(
      providers: [
        StreamProvider<MyScaffoldValue>.value(
          value: _screenVm.myScaffoldValueStream,
          initialData: const MyScaffoldValue("100"),
        ),
        Provider<MyScaffoldOnPressed>.value(
            value: MyScaffoldOnPressed(_screenVm.onPressed)),
      ],
      child: const MyScaffold(),
    );
  }

  void _navigateTo() {
    _buildContext.push("/screen2");
  }
}
