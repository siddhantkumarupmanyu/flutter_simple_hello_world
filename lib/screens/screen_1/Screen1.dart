import 'package:flutter/material.dart';
import 'package:flutter_spike_state_management/widgets/MyScaffold.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'Screen1Vm.dart';

class Screen1 extends StatelessWidget {
  final Screen1Vm _screenVm;

  const Screen1(this._screenVm, {super.key});

  @override
  Widget build(BuildContext context) {
    _screenVm.setNavigateTo((location) {
      context.push(location);
    });

    return StreamProvider.value(
        value: _screenVm.countStream.map((count) => Screen1ScaffoldDto(
            count.toString(), _screenVm.onPressed, "Screen 1")),
        initialData: Screen1ScaffoldDto("10", _screenVm.onPressed, "Screen 1"),
        child: const MyScaffold<Screen1ScaffoldDto>());
  }
}

final class Screen1ScaffoldDto implements MyScaffoldDto {
  Screen1ScaffoldDto(this.appBarValue, this.callback, this.value);

  @override
  final String appBarValue;

  @override
  final void Function() callback;

  @override
  final String value;
}
