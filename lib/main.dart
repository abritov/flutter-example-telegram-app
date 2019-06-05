import 'package:flutter/material.dart';

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
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _counter = 0;
  TabController _controller;

  @override
  void initState() {
    _controller = TabController(initialIndex: 0, length: 3, vsync: this);
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
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
      ContactModel(name: "John Appleseed", lastSeen: "1 minute ago"),
      ContactModel(name: "Phill Shiller", lastSeen: "40 minutes ago"),
      ContactModel(name: "Steve Balmer", lastSeen: "recently"),
    ], 10);
    return Scaffold(
        bottomNavigationBar: Container(
          decoration: BoxDecoration(color: Color(0xf7f7f7f7)),
          height: 53.0,
          child: TabBar(
            controller: _controller,
            indicatorColor: Colors.transparent,
            tabs: [
              Tab(
                  icon: IconTheme(
                    data: IconThemeData(color: Colors.grey),
                    child: Icon(Icons.person_pin),
                  ),
                  child: Text(
                    "Contacts",
                    style: TextStyle(color: Colors.grey, fontSize: 12.0),
                  )),
              Tab(
                  icon: IconTheme(
                      data: IconThemeData(color: Colors.grey),
                      child: Icon(Icons.chat_bubble_outline)),
                  child: Text(
                    "Chats",
                    style: TextStyle(color: Colors.grey, fontSize: 12.0),
                  )),
              Tab(
                  icon: IconTheme(
                      data: IconThemeData(color: Colors.grey),
                      child: Icon(Icons.settings)),
                  child: Text(
                    "Settings",
                    style: TextStyle(color: Colors.grey, fontSize: 12.0),
                  )),
            ],
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
            ),
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
                        )))
              ]),
            ),
            SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                final contact = contacts[index];
                return ListTile(
                    leading: CircleAvatar(),
                    title: Text(
                      contact.name,
                      style: TextStyle(fontSize: 15.0),
                    ),
                    subtitle: Text("last seen ${contact.lastSeen}",
                        style: TextStyle(fontSize: 14.0)));
              }, childCount: contacts.length),
            ),
          ],
        ));
  }
}
