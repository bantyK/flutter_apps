import 'package:flutter/material.dart';

Widget createListView() {
  return ListView(
    children: <Widget>[
      listTile(Icons.landscape, "Landscape", "Sunny lanscape"),
      listTile(Icons.laptop_chromebook, "Windows", "Operating System"),
      listTile(Icons.phone, "Phone", "Call Mom")
    ],
  );
}

ListTile listTile(icon, title, subtitle) {
  return ListTile(
    leading: Icon(icon),
    title: Text(title),
    subtitle: Text(subtitle),
    onTap: () {
      debugPrint("$title tapped");
    },
  );
}