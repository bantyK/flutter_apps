import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWordList extends StatelessWidget {
  var wordPair = WordPair.random();

  String getRandomWord() {
    wordPair = WordPair.random();
    return wordPair.asPascalCase;
  }

  Widget listTileWithRandomWord() {
    return ListTile(
      title: Text(
        getRandomWord(),
        textAlign: TextAlign.center,
      ),
    );
  }

  getListTiles() {
    var tiles = List<Widget>();
    for (var i = 0; i < 100; i++) {
      tiles.add(listTileWithRandomWord());
    }
    return tiles;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: getListTiles());
  }
}
