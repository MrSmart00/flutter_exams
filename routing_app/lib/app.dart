import 'package:flutter/material.dart';

import 'pages/counter.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: HomeView(),
      // home: CounterView(),
      routes: <String, WidgetBuilder> {
        "/": (BuildContext context) => HomeView(),
        "/counter": (BuildContext context) => CounterView(),
      },
    );
  }
}

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text("Push case 1"),
              shape: StadiumBorder(),
              onPressed: () => Navigator.of(context).pushNamed("/counter")
            ),
            RaisedButton(
              child: Text("Push case 2"),
              shape: StadiumBorder(),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => CounterView(),
                  )
                );
              }
            ),
            RaisedButton(
              child: Text("Modal Bottom"),
              shape: StadiumBorder(),
              onPressed: () => showModalBottomSheet(
                context: context,
                builder: (context) => CounterView()
              ),
            ),
            RaisedButton(
              child: Text("Modal Full Screen"),
              shape: StadiumBorder(),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CounterView(),
                    fullscreenDialog: true
                  )
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}