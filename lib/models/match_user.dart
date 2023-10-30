import 'package:tinder_clone/main.dart';
import 'package:tinder_clone/models/message.dart';
import 'package:tinder_clone/models/user.dart';

class MatchUser {
  User otherUser;
  List<Message> messages = [];

  MatchUser(this.otherUser);

  void addMessage(Message message) {
    Message? lastMessage = messages.last;
    if (lastMessage.owner == me.id) {
      message.isFollowUpMessage = true;
    }
    if (lastMessage.created.day < message.created.day) {
      message.isNewDate = true;
    } else {
      message.isNewDate = false;
    }
  }
}
