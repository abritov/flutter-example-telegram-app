import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 35.0,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Color(0xe9e9e9e9),
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: FlatButton.icon(
            onPressed: () {},
            textColor: Colors.grey,
            icon: Icon(Icons.search),
            label: Text(
              "Search",
              style: TextStyle(fontSize: 16.0),
            )));
  }
}
