import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_hello_world/widgets/MyScaffold.dart';

import 'Screen1Vm.dart';

class Screen1 extends StatelessWidget {
  final Screen1Vm _screenVm;

  const Screen1(this._screenVm, {super.key});

  @override
  Widget build(BuildContext context) {
    // _buildContext = context;
    return StreamProvider.value(
        value: _screenVm.countStream
            .map((count) => MyScaffoldDto(count.toString(), () {}, "Screen 1")),
        initialData: MyScaffoldDto("10", () {}, "Screen 1"),
        child: const MyScaffold());
  }

  void _navigateTo() {
    // _buildContext.push("/screen2");
  }
}
