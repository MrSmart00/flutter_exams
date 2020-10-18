import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';

final appProvider = ChangeNotifierProvider((_) => _AppNotifier());

class _AppNotifier extends ChangeNotifier {
  var _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void reset() {
    _count = 0;
    notifyListeners();
  }
}

class App extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CounterView(),
    );
  }
}

class CounterView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final counter = useProvider(appProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Counter with RiverPod"),
      ),
      body: SafeArea(
        child: Scaffold(
          body: Center(
            child: Text(
              counter.count.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          floatingActionButton: Column(
            // verticalDirection: VerticalDirection.up,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  onPressed: counter.reset,
                  tooltip: 'reset',
                  child: Icon(Icons.close),
                  backgroundColor: Colors.redAccent,
                ),
              ),
              FloatingActionButton(
                onPressed: counter.increment,
                tooltip: 'Increment',
                child: Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
