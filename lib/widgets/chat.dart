import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_ui_example_1/models/chat.dart';
import 'package:my_ui_example_1/widgets/contact.dart';
import 'package:my_ui_example_1/widgets/search.dart';

class ChatWidget extends StatelessWidget {
  ChatWidget(this.chat);
  ChatModel chat;

  @override
  Widget build(BuildContext context) {
    final contact = chat.person;

    final theme = Theme.of(context);
    return ListTile(
        leading: CircleAvatar(
          child: Text(contact.shortName),
          radius: 30.0,
        ),
        title: Text(
          contact.name,
          style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),
        ),
        trailing: Text(chat.lastMessageAt,
            style: TextStyle(color: theme.disabledColor)),
        subtitle: Text(chat.lastMessage.content,
            style: TextStyle(fontSize: 14.0, color: theme.disabledColor)));
  }
}

class ChatPage extends StatelessWidget {
  ChatPage(this.chats);

  List<ChatModel> chats;

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
    return CustomScrollView(controller: _scrollController, slivers: [
      SliverAppBar(
          pinned: true,
          elevation: 0.0,
          backgroundColor: Color(0xf7f7f7f7),
          title: Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text('Chats',
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
        delegate: SliverChildListDelegate(
            [SearchBoxWidget(hint: "Search for messages or users")]),
      ),
      SliverList(
        delegate: SliverChildListDelegate(chats
            .map((chat) =>
                _tileBorderContainer(ChatWidget(chat), divideBorderColor))
            .toList()),
      )
    ]);
  }
}
