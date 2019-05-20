import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();

    return MaterialApp(
      title: 'Random Name Generator',
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Welcome to Flutter"),
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            Text(wordPair.asPascalCase),
            RaisedButton(
              child: Text("Generate data"),
              onPressed: () {
                print(WordPair.random().asPascalCase);
              },
            )
          ],
        )),
      ),
    );
  }
}
