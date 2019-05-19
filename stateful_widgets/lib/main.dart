import 'package:flutter/material.dart';
import 'package:stateful_widgets/screens/main_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stateful widgets demo'),
        ),
        body: MainScreen(),
      ),
    );
  }
}
