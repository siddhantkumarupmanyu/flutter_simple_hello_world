import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spike_state_management/widgets/MyScaffold.dart';
import 'package:provider/provider.dart';

class Screen2 extends StatelessWidget {
  final Screen2Vm _screenVm = Screen2Vm();

  Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<MyScaffoldDto>.value(
          value: _screenVm.myScaffoldValueStream,
          initialData: Screen2ScaffoldDto("0", _screenVm.onPressed, "Screen 2"),
        ),
      ],
      child: const MyScaffold<Screen2ScaffoldDto>(),
    );
  }
}

class Screen2Vm {
  final StreamController<Screen2ScaffoldDto> _myScaffoldValueStreamController =
      StreamController();

  Stream<Screen2ScaffoldDto> get myScaffoldValueStream =>
      _myScaffoldValueStreamController.stream;

  int _count = 0;

  Screen2Vm();

  void onPressed() {
    _count++;
    _myScaffoldValueStreamController.add(Screen2ScaffoldDto(
        "$_count from screen 2", onPressed, "Screen 2"));
  }
}

final class Screen2ScaffoldDto implements MyScaffoldDto {
  Screen2ScaffoldDto(this.appBarValue, this.callback, this.value);

  @override
  final String appBarValue;

  @override
  final void Function() callback;

  @override
  final String value;
}
