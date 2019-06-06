import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TgBottomTabStateless extends StatelessWidget {
  TgBottomTabStateless({this.title, this.icon, this.focused = false});
  final String title;
  final IconData icon;
  final bool focused;

  @override
  Widget build(BuildContext context) {
    return Tab(
        icon: Padding(
          padding: EdgeInsets.only(top: 5.0),
          child: IconTheme(
              data: IconThemeData(color: focused ? Colors.blue : Colors.grey),
              child: Icon(icon)),
        ),
        child: Text(
          title,
          style: TextStyle(
              color: focused ? Colors.blue : Colors.grey, fontSize: 12.0),
        ));
  }
}

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
      ),
    );
  }
}

Widget createTabBar(TabController controller, List<Widget> bars) {}
