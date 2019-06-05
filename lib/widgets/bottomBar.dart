import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TgBottomTab extends StatefulWidget {
  TgBottomTab({this.title, this.icon});
  final String title;
  final IconData icon;

  @override
  _TgBottomTabState createState() => _TgBottomTabState();
}

class _TgBottomTabState extends State<TgBottomTab> {
  bool _focused = false;

  @override
  Widget build(BuildContext context) {
    return Tab(
        icon: IconTheme(
            data: IconThemeData(color: _focused ? Colors.blue : Colors.grey),
            child: Icon(widget.icon)),
        child: Text(
          widget.title,
          style: TextStyle(
              color: _focused ? Colors.blue : Colors.grey, fontSize: 12.0),
        ));
  }
}

Widget createTabBar(TabController controller, List<Widget> bars) {}
