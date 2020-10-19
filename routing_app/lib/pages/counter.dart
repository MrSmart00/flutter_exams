import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/counter.dart';

class CounterView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final counter = useProvider(counterProvider);
    final state = useProvider(counterProvider.state);
    return Scaffold(
      appBar: AppBar(
        title: Text("RiverPod and Freezed"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(state.text),
            Text(
              state.count.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: state.color,
        onPressed: state.enabled ? counter.increment : null,
        child: state.buttonIcon,
      ),
    );
  }
}
