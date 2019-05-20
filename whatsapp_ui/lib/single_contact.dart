import 'package:flutter/material.dart';

Widget buildSingleListItem() {
  return Row(
    children: <Widget>[
      CircleAvatar(
        backgroundImage: AssetImage("assets/avatar.jpg"),
      )
    ],
  );
}
