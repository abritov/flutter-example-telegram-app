import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_ui_example_1/widgets/search.dart';

class SettingsPage extends StatelessWidget {
  ScrollController _scrollController =
      ScrollController(initialScrollOffset: 55.2);

  Widget _tileBorderContainer(Widget tile, Color borderColor) {
    final _borderSideDivider = BorderSide(width: 1.0, color: borderColor);
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, border: Border(bottom: _borderSideDivider)),
      child: tile,
    );
  }

  @override
  Widget build(BuildContext context) {
    final divideBorderColor = Theme.of(context).dividerColor;
    final borderSideDivider = BorderSide(width: 1.0, color: divideBorderColor);
    final gap = Container(
      decoration: BoxDecoration(color: Color(0xFFEFEEF3)),
      height: 40.0,
    );
    final arrowButton = IconButton(
      icon: Icon(Icons.arrow_forward_ios),
      iconSize: 15.0,
    );
    final entries = [
      gap,
      ListTile(
          dense: true,
          title: Text(
            "Proxy",
            style: TextStyle(fontSize: 16.0),
          ),
          leading: IconTheme(
            data: IconThemeData(color: Colors.green),
            child: Icon(Icons.sentiment_satisfied),
          ),
          trailing: FlatButton(
            onPressed: () {},
            splashColor: Colors.transparent,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("Disabled", style: TextStyle(fontSize: 15.0)),
                const SizedBox(width: 4.0),
                IconTheme(
                    data: IconThemeData(size: 15.0),
                    child: Icon(Icons.arrow_forward_ios)),
              ],
            ),
          )),
      gap,
      ListTile(
        dense: true,
        title: Text(
          "Saved messages",
          style: TextStyle(fontSize: 16.0),
        ),
        leading: IconTheme(
          data: IconThemeData(color: Colors.green),
          child: Icon(Icons.message),
        ),
        trailing: arrowButton,
      ),
      ListTile(
        dense: true,
        title: Text(
          "Recent Calls",
          style: TextStyle(fontSize: 16.0),
        ),
        leading: IconTheme(
          data: IconThemeData(color: Colors.green),
          child: Icon(Icons.call),
        ),
        trailing: arrowButton,
      ),
      ListTile(
        dense: true,
        title: Text(
          "Stickers",
          style: TextStyle(fontSize: 16.0),
        ),
        leading: IconTheme(
          data: IconThemeData(color: Colors.green),
          child: Icon(Icons.store_mall_directory),
        ),
        trailing: arrowButton,
      ),
      gap,
      ListTile(
        dense: true,
        title: Text(
          "Notifications and Sounds",
          style: TextStyle(fontSize: 16.0),
        ),
        leading: IconTheme(
          data: IconThemeData(color: Colors.green),
          child: Icon(Icons.surround_sound),
        ),
        trailing: arrowButton,
      ),
      ListTile(
        dense: true,
        title: Text(
          "Privacy and Security",
          style: TextStyle(fontSize: 16.0),
        ),
        leading: IconTheme(
          data: IconThemeData(color: Colors.green),
          child: Icon(Icons.security),
        ),
        trailing: arrowButton,
      ),
      ListTile(
        dense: true,
        title: Text(
          "Data and Storage",
          style: TextStyle(fontSize: 16.0),
        ),
        leading: IconTheme(
          data: IconThemeData(color: Colors.green),
          child: Icon(Icons.data_usage),
        ),
        trailing: arrowButton,
      ),
      ListTile(
        dense: true,
        title: Text(
          "Appearance",
          style: TextStyle(fontSize: 16.0),
        ),
        leading: IconTheme(
          data: IconThemeData(color: Colors.green),
          child: Icon(Icons.color_lens),
        ),
        trailing: arrowButton,
      )
    ].map((tile) => _tileBorderContainer(tile, divideBorderColor));

    return CustomScrollView(controller: _scrollController, slivers: [
      SliverAppBar(
          pinned: true,
          elevation: 0.0,
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
                    BoxDecoration(border: Border(bottom: borderSideDivider))),
          )),
      SliverList(
        delegate: SliverChildListDelegate([
          SearchBoxWidget(),
          Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      bottom: borderSideDivider, top: borderSideDivider)),
              height: 90.0,
              child: ListTile(
                leading: CircleAvatar(
                  child: Text("Me"),
                  radius: 30.0,
                ),
                title: Padding(
                  padding: EdgeInsets.only(top: 12.0),
                  child: Text("Alexander",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w500)),
                ),
                subtitle: Padding(
                    padding: EdgeInsets.only(top: 2.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("+7 999 999-99-99",
                              style: TextStyle(fontSize: 16.0)),
                          Text("@telegram", style: TextStyle(fontSize: 16.0))
                        ])),
                trailing: IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  iconSize: 15.0,
                ),
              )),
        ]..addAll(entries)),
      )
    ]);
  }
}
