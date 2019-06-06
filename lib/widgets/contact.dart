import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_ui_example_1/models/contact.dart';

class ContactWidget extends StatelessWidget {
  ContactWidget(this.contact);
  ContactModel contact;

  @override
  Widget build(BuildContext context) {
    final shortName =
        "${contact.name.substring(0, 1)}${contact.lastName.substring(0, 1)}";
    return ListTile(
        dense: true,
        leading: CircleAvatar(
          child: Text(shortName),
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
