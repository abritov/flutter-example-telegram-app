import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBoxWidget extends StatelessWidget {
  SearchBoxWidget({this.hint = "Search"});

  String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 33.0,
        margin: EdgeInsets.only(right: 13.0),
        decoration: BoxDecoration(
            color: Color(0xe9e9e9e9),
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: FlatButton.icon(
            onPressed: () {},
            textColor: Colors.grey,
            icon: Icon(Icons.search),
            label: Text(
              hint,
              style: TextStyle(fontSize: 16.0),
            )));
  }
}
