import 'package:flutter/material.dart';
import 'package:my_ui_example_1/widgets/bottomBar.dart';
import 'package:my_ui_example_1/widgets/contact.dart';

import 'models/contact.dart';

void main() => runApp(MyApp());

List<T> repeat<T>(List<T> listIn, int times) {
  var outList = new List<T>();
  for (var i = 0; i < times; i++) {
    outList.addAll(listIn);
  }
  return outList;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  List<Widget> _bottomTabs = [
    TgBottomTabStateless(
        icon: Icons.person_pin, title: "Contacts", focused: true),
    TgBottomTabStateless(icon: Icons.chat_bubble_outline, title: "Chats"),
    TgBottomTabStateless(icon: Icons.settings, title: "Settings"),
  ];

  @override
  void initState() {
    _controller = TabController(initialIndex: 0, length: 3, vsync: this);
  }

  void _updateTabs(int index) {
    setState(() {
      _bottomTabs = [
        TgBottomTabStateless(
            icon: Icons.person_pin, title: "Contacts", focused: index == 0),
        TgBottomTabStateless(
            icon: Icons.chat_bubble_outline,
            title: "Chats",
            focused: index == 1),
        TgBottomTabStateless(
            icon: Icons.settings, title: "Settings", focused: index == 2),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    final contacts = repeat([
      ContactModel(
          name: "John", lastName: "Appleseed", lastSeen: "1 minute ago"),
      ContactModel(
          name: "Phill", lastName: "Shiller", lastSeen: "40 minutes ago"),
      ContactModel(name: "Steve", lastName: "Balmer", lastSeen: "recently"),
    ], 10);
    return Scaffold(
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Color(0xf7f7f7f7),
            border: Border(
                top: BorderSide(
                    width: 1.0, color: Theme.of(context).dividerColor)),
          ),
          height: 54.0,
          child: TabBar(
            onTap: (index) => _updateTabs(index),
            controller: _controller,
            indicatorColor: Colors.transparent,
            tabs: _bottomTabs,
          ),
        ),
        appBar: PreferredSize(
          preferredSize: Size(0.0, 0.0),
          child: Text(""),
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
                pinned: true,
                backgroundColor: Color(0xf7f7f7f7),
                title: Text('Contacts',
                    style: TextStyle(color: Colors.black, fontSize: 17.0)),
                actions: [
                  IconButton(
                    icon: Icon(Icons.add),
                    color: Color(0xFF5E92D7),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {},
                  ),
                ],
                bottom: PreferredSize(
                  preferredSize: Size(1.0, 1.0),
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1.0,
                                  color: Theme.of(context).dividerColor)))),
                )),
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
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
                        ))),
                ListTile(
                    leading: Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: IconTheme(
                            data: IconThemeData(color: Colors.blue),
                            child: Icon(Icons.person_add))),
                    title: Text("Invite Friends",
                        style: TextStyle(color: Colors.blue))),
              ]),
            ),
            SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border(
                          bottom: BorderSide(
                              width: 1.0,
                              color: Theme.of(context).dividerColor))),
                  child: ContactWidget(contacts[index]),
                );
              }, childCount: contacts.length),
            ),
          ],
        ));
  }
}
