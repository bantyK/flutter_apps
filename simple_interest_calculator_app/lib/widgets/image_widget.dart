import 'package:flutter/material.dart';

class TopImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 20.0),
        color: Colors.transparent,
        width: 250.0,
        height: 100.0,
        child: Image.asset('assets/images/logo.png')
    );
  }
}
