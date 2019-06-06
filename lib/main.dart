import 'package:flutter/material.dart';
import 'package:my_ui_example_1/widgets/bottomBar.dart';
import 'package:my_ui_example_1/widgets/contact.dart';
import 'package:my_ui_example_1/widgets/settings.dart';

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
  TabController _tabController;
  List<Widget> _bottomTabs = [
    TgBottomTabStateless(
        icon: Icons.person_pin, title: "Contacts", focused: true),
    TgBottomTabStateless(icon: Icons.chat_bubble_outline, title: "Chats"),
    TgBottomTabStateless(icon: Icons.settings, title: "Settings"),
  ];

  @override
  void initState() {
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
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
            controller: _tabController,
            indicatorColor: Colors.transparent,
            tabs: _bottomTabs,
          ),
        ),
        appBar: PreferredSize(
          preferredSize: Size(0.0, 0.0),
          child: Text(""),
        ),
        body: TabBarView(
            controller: _tabController,
            physics: NeverScrollableScrollPhysics(),
            children: [
              ContactsPage(contacts),
              Icon(Icons.directions_transit),
              SettingsPage(),
            ]));
  }
}
