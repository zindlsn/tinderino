enum MessageStatus { created, sending, sent, read, deleted }

class Message {
  String owner;
  String message;
  late DateTime created;
  late MessageStatus status;

  bool isFollowUpMessage = false;
  bool isNewDate = false;

  Message(this.owner, this.message) {
    created = DateTime.now();
    status = MessageStatus.created;
  }
}
