import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_ui_example_1/models/contact.dart';
import 'package:my_ui_example_1/widgets/search.dart';

class ContactWidget extends StatelessWidget {
  ContactWidget(this.contact, this.dense);
  ContactModel contact;
  bool dense = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        dense: dense,
        leading: CircleAvatar(
          child: Text(contact.shortName),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              contact.name,
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: contact.lastName == ""
                      ? FontWeight.w600
                      : FontWeight.normal),
            ),
            Text(" ${contact.lastName}",
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600))
          ],
        ),
        subtitle: Text("last seen ${contact.lastSeen}",
            style: TextStyle(fontSize: 14.0)));
  }
}

class ContactsPage extends StatelessWidget {
  ContactsPage(this.contacts);
  List<ContactModel> contacts;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
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
            SearchBoxWidget(),
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
                          width: 1.0, color: Theme.of(context).dividerColor))),
              child: ContactWidget(contacts[index], true),
            );
          }, childCount: contacts.length),
        ),
      ],
    );
  }
}
