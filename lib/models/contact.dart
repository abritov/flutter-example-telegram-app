import 'dart:ui';

class ContactModel {
  ContactModel({this.name, this.lastName = "", this.lastSeen, this.avatar});
  String name;
  String lastName;
  String lastSeen;
  Image avatar;
}
