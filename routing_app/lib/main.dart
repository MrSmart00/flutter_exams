import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routing_app/models/environment.dart';

import 'app.dart';
import 'providers/counter.dart';

class _Environment extends Environment {
  ProviderCallback counterProvider;

  _Environment({this.counterProvider});
}

void main() {
  runApp(
    ProviderScope(
        child: App(
      _Environment(
        counterProvider: () =>
            StateNotifierProvider((_) => CounterController()),
      ),
    )),
  );
}
