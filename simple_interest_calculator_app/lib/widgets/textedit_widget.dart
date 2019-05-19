import 'package:flutter/material.dart';

class TextEditWidget extends StatefulWidget {
  final String labelText;
  final String hintText;
  TextEditWidget(this.labelText, this.hintText);

  @override
  State<StatefulWidget> createState() {
    return _TextEditWidgetState();
  }
}

class _TextEditWidgetState extends State<TextEditWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            labelText: widget.labelText,
            hintText: widget.hintText,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
      ),
    );
  }
}
