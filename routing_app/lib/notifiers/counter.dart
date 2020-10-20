import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routing_app/models/counter.dart';

abstract class CounterNotifier extends StateNotifier<Counter> {
  CounterNotifier(Counter state) : super(state);

  void increment();
}
