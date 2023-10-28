import 'package:flutter/material.dart';
import 'package:flutter_spike_state_management/CountRepository.dart';
import 'package:flutter_spike_state_management/widgets/MyScaffold.dart';
import 'package:provider/provider.dart';

class Screen2 extends StatelessWidget {
  final CountRepository _repo;

  const Screen2(this._repo, {super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider.value(
          value: _repo.countSteam.map((count) {
            print("got value s2 $count");
            return Screen2ScaffoldDto(count.toString(), _onClick, "Screen 2");
          }),
          initialData: Screen2ScaffoldDto("0", _onClick, "Screen 2"),
        ),
      ],
      child: const MyScaffold<Screen2ScaffoldDto>(),
    );
  }

  void _onClick() {
    _repo.getAndUpdate((value) => value + 2);
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
