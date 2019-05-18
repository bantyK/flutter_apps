import 'package:flutter/material.dart';
import 'package:flutter_udemy/screens/MainScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter list view",
      home: Scaffold(
        appBar: AppBar(title: Text("List view demo")),
        body: MainScreen(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            debugPrint("FAB clicked");
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
