import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
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

  Widget _Item(Content content) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 40),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  content.thumbnail.toString(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Text(
              content.title,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              DateFormat('MM/dd HH:mm').format(content.createdAt),
              style: TextStyle(
                color: Colors.grey,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
