import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'src/articles.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter hacker news app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter hacker news app'),
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
  final List<Article> _articles = articles;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 1));
            setState(() {
              _articles.removeAt(0);
            });
          },
          child: ListView(
            children: _articles.map((article) => buildItems(article)).toList(),
          ),
        ));
  }

  Widget buildItems(Article article) {
    return Padding(
      key: Key(article.text),
      padding: const EdgeInsets.all(16.0),
      child: new ExpansionTile(
        title: Text(
          article.text,
          style: TextStyle(fontSize: 24.0),
        ),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("${article.commentsCount} comments"),
              IconButton(
                color: Colors.blueAccent,
                icon: Icon(Icons.launch),
                onPressed: () async {
                  var fakeUrl = "http://${article.domain}";
                  if (await canLaunch(fakeUrl)) {
                    launch(fakeUrl);
                  }
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
