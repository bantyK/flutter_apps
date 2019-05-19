import 'package:flutter/material.dart';
import 'package:simple_interest_calculator_app/widgets/image_widget.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  var _currencies = ['Rupees', 'Dollars', 'Pounds'];
  var _selectedCurrencyValue = 'Rupees';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Interest Calculator"),
      ),
      body: Container(
        color: Colors.lightBlue,
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            TopImage(),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Principal Amount',
                    hintText: 'Enter the principal amount eg 10000',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Rate of Interest',
                  hintText: 'In percentage',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Rate of Interest',
                        hintText: 'In percentage',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 25.0,
                  ),
                  Expanded(
                    child: DropdownButton<String>(
                      items: _currencies.map((String currency) {
                        return DropdownMenuItem<String>(
                          value: currency,
                          child: Text(currency),
                        );
                      }).toList(),
                      value: _selectedCurrencyValue,
                      onChanged: (String selectedValue) {
                        _selectedCurrencyValue = selectedValue;
                      },
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.only(bottom: 25.0, top: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        onPressed: () {},
                        child: Text('Calculate'),
                      ),
                    ),
                    Expanded(
                      child: RaisedButton(
                        onPressed: () {},
                        child: Text('Reset'),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("This will be invisible"),
            )
          ],
        ),
      ),
    );
  }
}
