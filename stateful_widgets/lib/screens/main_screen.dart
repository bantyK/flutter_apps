import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  String name = "";
  var _countries = ["India", "Malaysia", "Thailand"];
  var _currentItemSelected = 'India';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          TextField(
            onSubmitted: (String input) {
              setState(() {
                name = input;
              });
            },
          ),
          DropdownButton<String>(
              items: _countries.map((String country) {
                return DropdownMenuItem<String>(
                  value: country,
                  child: Text(country),
                );
              }).toList(),
              value: _currentItemSelected,
              onChanged: (String selectedValue) {
                _dropDownItemSelected(selectedValue);
              }),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text("You selected $_currentItemSelected"),
          ),
        ],
      ),
    );
  }

  void buttonClicked() {
    setState(() {
      name = "After click";
    });
  }

  void _dropDownItemSelected(String selectedValue) {
    setState(() {
      this._currentItemSelected = selectedValue;
    });
  }
}
