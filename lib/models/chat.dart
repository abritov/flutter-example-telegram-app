import 'package:my_ui_example_1/models/contact.dart';

class MessageModel {
  MessageModel(this.sender, this.content, this.receivedAt);

  ContactModel sender;
  String content;
  DateTime receivedAt;
}

class ChatModel {
  ChatModel(this.person, {this.history = const []});

  ContactModel person;
  List<MessageModel> history;

  MessageModel get lastMessage {
    return history.last;
  }

  String get lastMessageAt {
    final localTime = lastMessage.receivedAt.toLocal();
    return "${localTime.hour}:${localTime.second}";
  }
}
