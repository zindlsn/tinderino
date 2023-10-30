enum MessageStatus { created, sending, sent, read, deleted }

enum MessageSender { me, other }

class Message {
  String owner;
  String message;
  late DateTime created;
  late MessageStatus status;

  bool isFollowUpMessage = false;
  bool isNewDate = false;
  MessageSender sender = MessageSender.me;

  Message(this.owner, this.message) {
    created = DateTime.now();
    status = MessageStatus.created;
  }
}
