import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_ui_example_1/widgets/search.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _borderSideDivider =
        BorderSide(width: 1.0, color: Theme.of(context).dividerColor);
    final gap = Container(
      decoration: BoxDecoration(color: Colors.grey),
      // width: 50.0,
      height: 40.0,
    );
    return CustomScrollView(slivers: [
      SliverAppBar(
          pinned: true,
          backgroundColor: Color(0xf7f7f7f7),
          title: Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text('Settings',
                style: TextStyle(color: Colors.black, fontSize: 17.0)),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.edit),
              color: Color(0xFF5E92D7),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {},
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size(1.0, 1.0),
            child: Container(
                decoration:
                    BoxDecoration(border: Border(bottom: _borderSideDivider))),
          )),
      SliverList(
        delegate: SliverChildListDelegate([
          SearchBoxWidget(),
          Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      bottom: _borderSideDivider, top: _borderSideDivider)),
              padding: EdgeInsets.only(left: 12.0, right: 15.0),
              // margin: EdgeInsets.only(top: 10, bottom: 8.0),
              child: ListTile(
                leading: CircleAvatar(
                  child: Text("Me"),
                  radius: 30.0,
                ),
                title: Text("Alexander",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
                subtitle: Padding(
                    padding: EdgeInsets.only(top: 4.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("+7 999 999-99-99",
                              style: TextStyle(fontSize: 16.0)),
                          Text("@telegram", style: TextStyle(fontSize: 16.0))
                        ])),
                trailing: IconButton(
                  padding: EdgeInsets.only(left: 30.0),
                  icon: Icon(Icons.arrow_forward_ios),
                  iconSize: 15.0,
                ),
              )),
          gap,
          Container(
              padding: EdgeInsets.all(15.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconTheme(
                      data: IconThemeData(color: Colors.green),
                      child: Icon(Icons.sentiment_satisfied),
                    ),
                    Text("Proxy"),
                    Text("Disabled"),
                    IconButton(
                      padding: EdgeInsets.only(left: 30.0),
                      icon: Icon(Icons.arrow_forward_ios),
                      iconSize: 15.0,
                    ),
                  ])),
          gap,
          ListTile(
              dense: true,
              title: Text("Proxy"),
              leading: IconTheme(
                data: IconThemeData(color: Colors.green),
                child: Icon(Icons.sentiment_satisfied),
              ),
              trailing: IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                onPressed: () {},
                iconSize: 15.0,
              )),
          gap
        ]),
      )
    ]);
  }
}
