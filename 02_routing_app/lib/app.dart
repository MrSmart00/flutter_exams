import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/environment.dart';
import 'pages/counter.dart';
import 'pages/home.dart';

class App extends StatelessWidget {
  final Environment environment;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String, WidgetBuilder>{
        "/": (BuildContext context) => HomeView(environment),
        "/counter": (BuildContext context) =>
            CounterView(environment.counterProvider()),
      },
    );
  }

  App(this.environment);
}
