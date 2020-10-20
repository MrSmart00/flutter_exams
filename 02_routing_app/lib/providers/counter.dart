import 'package:flutter/material.dart';
import 'package:routing_app/models/counter.dart';
import 'package:routing_app/notifiers/counter.dart';

class CounterController extends CounterNotifier {
  CounterController()
      : super(Counter(
          count: 0,
          enabled: true,
          color: Colors.blue,
          text: "You have pushed the button this many times:",
          buttonIcon: Icon(Icons.add),
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
        buttonIcon: Icon(Icons.close),
      );
    }
  }
}
