import 'package:flutter/material.dart';
import 'package:freezed_usage/models/counter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final counterProvider = StateNotifierProvider((context) => _CounterController());

class _CounterController extends StateNotifier<Counter> {
  _CounterController() : super(Counter(
      count: 0,
      enabled: true,
      color: Colors.blue,
      text: "You have pushed the button this many times:",
      buttonIcon: Icon(Icons.add)
  ));

  void increment() {
    state = state.copyWith(count: state.count + 1);
    checkEnabled();
  }

  void checkEnabled() {
    if (state.count >= 10) {
      state = state.copyWith(
          enabled: false,
          text: "Reached limit...",
          color: Colors.grey,
          buttonIcon: Icon(Icons.close)
      );
    }
  }
}
