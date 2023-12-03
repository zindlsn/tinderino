import 'package:tinder_clone/models/message.dart';
import 'package:tinder_clone/models/user.dart';

class MatchUser {
  User otherUser;
  List<Message> messages = [];

  MatchUser(this.otherUser);

  void addMessage(Message message) {
    Message? lastMessage = messages.isNotEmpty ? messages.last : null;
    if (lastMessage != null) {
      if (lastMessage.owner == message.owner) {
        message.isFollowUpMessage = true;
      }

      if ((lastMessage.created
                  .toUtc()
                  .difference(message.created.toUtc())
                  .inDays)
              .abs() >=
          1) {
        message.isNewDate = true;
      } else {
        message.isNewDate = false;
      }
    } else {
      message.isNewDate = true;
    }
    messages.add(message);
  }
}
