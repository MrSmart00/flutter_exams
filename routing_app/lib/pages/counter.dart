import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routing_app/notifiers/counter.dart';

class _CounterView extends HookWidget {
  final StateNotifierProvider<CounterNotifier> provider;

  _CounterView(this.provider);

  @override
  Widget build(BuildContext context) {
    final state = useProvider(provider.state);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(state.text),
        Text(
          state.count.toString(),
          style: Theme.of(context).textTheme.headline4,
        ),
      ],
    );
  }
}

class _CounterButton extends HookWidget {
  final StateNotifierProvider<CounterNotifier> provider;

  @override
  Widget build(BuildContext context) {
    final counter = useProvider(provider);
    final state = useProvider(provider.state);
    return FloatingActionButton(
      backgroundColor: state.color,
      onPressed: state.enabled ? counter.increment : null,
      child: state.buttonIcon,
    );
  }

  _CounterButton(this.provider);
}

class CounterView extends StatelessWidget {
  final StateNotifierProvider<CounterNotifier> provider;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RiverPod and Freezed"),
      ),
      body: Center(
        child: _CounterView(provider),
      ),
      floatingActionButton: _CounterButton(provider),
    );
  }

  CounterView(this.provider);
}
