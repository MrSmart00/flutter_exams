import 'package:flutter/material.dart';

import 'pages/counter.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CounterView(),
    );
  }
}
