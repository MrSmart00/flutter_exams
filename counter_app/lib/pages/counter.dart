import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/counter.dart';

class CounterLabel extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final count = useProvider(counterProvider.state);
    return Text(
      "$count",
      style: Theme.of(context).textTheme.headline4,
    );
  }
}

class CounterIncrementButton extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final counter = useProvider(counterProvider);
    return FloatingActionButton(
      onPressed: counter.increment,
      child: Icon(Icons.add),
    );
  }
}

class CounterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter with RiverPod"),
      ),
      body: SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'You have pushed the button this many times:',
                ),
                CounterLabel(),
              ],
            ),
          ),
          floatingActionButton: CounterIncrementButton(),
        ),
      ),
    );
  }
}
