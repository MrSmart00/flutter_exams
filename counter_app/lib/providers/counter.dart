import 'package:hooks_riverpod/hooks_riverpod.dart';

final counterProvider = StateNotifierProvider((context) => _CounterController());

class _CounterController extends StateNotifier<int> {
  _CounterController() : super(0);

  void increment() {
    state++;
  }
}
