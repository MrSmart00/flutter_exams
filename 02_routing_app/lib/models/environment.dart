import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routing_app/notifiers/counter.dart';

typedef ProviderCallback = StateNotifierProvider<CounterNotifier> Function();

abstract class Environment {
  ProviderCallback counterProvider;
}
