import 'dart:ui';

class ContactModel {
  ContactModel({this.name, this.lastName = "", this.lastSeen, this.avatar});
  String name;
  String lastName;
  String lastSeen;
  Image avatar;

  String get shortName {
    final lastNameShort = lastName == "" ? "" : "${lastName.substring(0, 1)}";
    return "${name.substring(0, 1)}$lastNameShort";
  }
}
