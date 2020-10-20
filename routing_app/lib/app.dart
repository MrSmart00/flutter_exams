import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'models/environment.dart';
import 'pages/counter.dart';
// import 'providers/counter.dart';
//
// typedef ProviderCallback = StateNotifierProvider<CounterController> Function();
//
// class Environment {
//   ProviderCallback counterProvider;
//
//   Environment({@required this.counterProvider});
// }

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

class HomeView extends StatelessWidget {
  final Environment environment;

  @override
  Widget build(BuildContext context) {
    final provider = environment.counterProvider();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text("Push case 1"),
              shape: StadiumBorder(),
              onPressed: () => Navigator.of(context).pushNamed("/counter"),
            ),
            RaisedButton(
              child: Text("Push case 2"),
              shape: StadiumBorder(),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CounterView(provider),
                  ),
                );
              },
            ),
            RaisedButton(
              child: Text("Modal Bottom"),
              shape: StadiumBorder(),
              onPressed: () => showModalBottomSheet(
                context: context,
                builder: (context) => CounterView(provider),
              ),
            ),
            RaisedButton(
              child: Text("Modal Full Screen case 1"),
              shape: StadiumBorder(),
              onPressed: () => showCupertinoModalPopup(
                context: context,
                builder: (context) => CounterView(provider),
              ),
            ),
            RaisedButton(
              child: Text("Modal Full Screen case 2"),
              shape: StadiumBorder(),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CounterView(provider),
                  fullscreenDialog: true,
                ));
              },
            ),
          ],
        ),
      ),
    );
  }

  HomeView(this.environment);
}
