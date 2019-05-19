import 'package:flutter/material.dart';
import 'package:simple_interest_calculator_app/widgets/image_widget.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  var _formKey = GlobalKey<FormState>();

  var _currencies = ['Rupees', 'Dollars', 'Pounds'];
  var _selectedCurrencyValue;
  var amountOutput;

  @override
  void initState() {
    super.initState();
    this._selectedCurrencyValue = _currencies[0];
    this.amountOutput = '';
  }

  TextEditingController principalController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController termsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;

    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Interest Calculator"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: ListView(
            children: <Widget>[
              TopImage(),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: principalController,
                  style: textStyle,
                  validator: (String value) {
                    if (value.isEmpty || int.parse(value) <= 0) {
                      return "Enter a positive value";
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'Principal Amount',
                      hintText: 'Enter the principal amount eg 10000',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: roiController,
                  style: textStyle,
                  validator: (String value) {
                    if (value.isEmpty || int.parse(value) <= 0) {
                      return "Enter a positive value";
                    }
                  },
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
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        style: textStyle,
                        controller: termsController,
                        validator: (String value) {
                          if (value.isEmpty || int.parse(value) <= 0) {
                            return "Enter a positive value";
                          }
                        },
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
                          _onDropDownItemSelected(selectedValue);
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
                          color: Theme.of(context).accentColor,
                          textColor: Theme.of(context).primaryColorDark,
                          onPressed: () {
                            setState(() {
                              if (_formKey.currentState.validate()) {
                                this.amountOutput = _calculateTotalReturn();
                              }
                            });
                          },
                          child: Text(
                            'Calculate',
                            textScaleFactor: 1.2,
                          ),
                        ),
                      ),
                      Expanded(
                        child: RaisedButton(
                          color: Theme.of(context).primaryColorDark,
                          textColor: Theme.of(context).primaryColorLight,
                          onPressed: () {
                            setState(() {
                              clear();
                            });
                          },
                          child: Text(
                            'Reset',
                            textScaleFactor: 1.2,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  this.amountOutput,
                  textAlign: TextAlign.center,
                  style: textStyle,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onDropDownItemSelected(String selectedValue) {
    setState(() {
      this._selectedCurrencyValue = selectedValue;
    });
  }

  String _calculateTotalReturn() {
    double principleAmount = double.parse(principalController.text);
    double roi = double.parse(roiController.text);
    double terms = double.parse(termsController.text);

    double totalAmountPayable =
        principleAmount + ((principleAmount * roi * terms) / 100);

    return "Total amount: $totalAmountPayable";
  }

  void clear() {
    this.principalController.clear();
    this.roiController.clear();
    this.termsController.clear();
    this.amountOutput = '';
  }
}
