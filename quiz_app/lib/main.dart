import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_app/answer.dart';
import 'dart:convert';

import 'package:quiz_app/quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz app',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: HomePage(
        title: 'Quiz App',
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Quiz quiz;
  List<Results> results;

  Future<void> fetchQuestions() async {
    var res = await http.get("https://opentdb.com/api.php?amount=20");
    var decodedResponse = jsonDecode(res.body);
    print(decodedResponse);
    quiz = Quiz.fromJson(decodedResponse);
    results = quiz.results;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz app"),
        elevation: 0.0,
      ),
      body: FutureBuilder(
        future: fetchQuestions(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text("Waiting...");
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              if (snapshot.hasError) return errorData(snapshot);
              return questionList();
              break;
            default:
              return null;
          }
        },
      ),
    );
  }

  // Error data widget
  Padding errorData(AsyncSnapshot snapshot) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Error: ${snapshot.error}',
          ),
          SizedBox(
            height: 20.0,
          ),
          RaisedButton(
            child: Text("Try Again"),
            onPressed: () {
              fetchQuestions();
              setState(() {});
            },
          )
        ],
      ),
    );
  }

  //List view for questionList
  ListView questionList() {
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) => Card(
            color: Colors.white,
            elevation: 0.0,
            child: ExpansionTile(
              title: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      results[index].question,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          FilterChip(
                            backgroundColor: Colors.grey[100],
                            label: Text(results[index].category),
                            onSelected: (b) {},
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          FilterChip(
                            backgroundColor: Colors.grey[100],
                            label: Text(
                              results[index].category,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              leading: CircleAvatar(
                backgroundColor: Colors.grey[100],
                child: Text(results[index].type.startsWith("m") ? "M" : "B"),
              ),
              children: results[index].allAnswers.map((m) {
                return AnswerWidget(results, index, m);
              }).toList(),
            ),
          ),
    );
  }
}
