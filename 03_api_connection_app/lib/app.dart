import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import 'api/repository.dart';
import 'models/content.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Content> contents;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('ja');
    testConnection();
  }

  void testConnection() {
    final ChopperClient client = ChopperClient(
      baseUrl: "https://run.mocky.io",
    );

    final repository = Repository(client);
    repository.fetchContents().then((value) {
      print("${value.length}");
      this.setState(() {
        this.contents = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return _Item(contents[index]);
        },
        itemCount: contents?.length ?? 0,
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget _Item(Content content) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 2.0),
      ),
      child: Column(
        children: [
          Image.network(content.thumbnail.toString()),
          Text(
            content.title,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Text(
            DateFormat('yyyy/MM/dd(E) HH:mm', "ja_JP")
                .format(content.createdAt),
          ),
        ],
      ),
    );
  }
}
