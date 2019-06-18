import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_ui_example_1/models/chat.dart';
import 'package:my_ui_example_1/widgets/bottomBar.dart';
import 'package:my_ui_example_1/widgets/chat.dart';
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
  int _selectedTabIndex = 0;

  @override
  void initState() {
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
  }

  List<Widget> _renderTabs(int index) => [
        TgBottomTabStateless(
            icon: CupertinoIcons.person_solid,
            title: "Contacts",
            focused: index == 0),
        TgBottomTabStateless(
            icon: IconData(0xf3fc,
                fontFamily: 'CupertinoIcons', fontPackage: 'cupertino_icons'),
            title: "Chats",
            focused: index == 1),
        TgBottomTabStateless(
            icon: CupertinoIcons.settings_solid,
            title: "Settings",
            focused: index == 2),
      ];

  void _updateTabs(int index) {
    setState(() {
      _selectedTabIndex = index;
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
      ContactModel(name: "Tina", lastSeen: "recently"),
    ], 10);
    final chats = repeat([
      ChatModel(contacts[0], history: [
        MessageModel(
            contacts[0], "Hi", DateTime.now().subtract(Duration(hours: 2)))
      ]),
      ChatModel(contacts[1], history: [
        MessageModel(contacts[1], "Call me later",
            DateTime.now().subtract(Duration(minutes: 2)))
      ]),
      ChatModel(contacts[2], history: [
        MessageModel(contacts[2], "Buy some apples",
            DateTime.now().subtract(Duration(hours: 1)))
      ]),
      ChatModel(contacts[3], history: [
        MessageModel(
            contacts[3], "Hi", DateTime.now().subtract(Duration(hours: 4)))
      ]),
    ], 3);
    return Scaffold(
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Color(0xf7f7f7f7),
            border: Border(
                top: BorderSide(
                    width: 1.0, color: Theme.of(context).dividerColor)),
          ),
          height: 56.0,
          child: TabBar(
            onTap: (index) => _updateTabs(index),
            controller: _tabController,
            indicatorColor: Colors.transparent,
            tabs: _renderTabs(_selectedTabIndex),
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
              ChatPage(chats),
              SettingsPage(),
            ]));
  }
}
