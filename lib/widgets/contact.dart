import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_ui_example_1/models/contact.dart';

class ContactWidget extends StatelessWidget {
  ContactWidget(this.contact);
  ContactModel contact;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        dense: true,
        leading: CircleAvatar(),
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
