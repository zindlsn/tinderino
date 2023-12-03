import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:tinder_clone/main.dart';
import 'package:tinder_clone/models/match_user.dart';
import 'package:tinder_clone/models/message.dart';

// ignore: must_be_immutable
class MatchChatPage extends StatefulWidget {
  MatchUser matchUser;
  MatchChatPage(this.matchUser, {super.key});

  @override
  State<MatchChatPage> createState() => _MatchChatPageState();
}

class _MatchChatPageState extends State<MatchChatPage> {
  final _messageController = TextEditingController();
  final _myController = ScrollController();
  late MatchUser matchUser;
  @override
  void initState() {
    matchUser = widget.matchUser;

    matchUser.addMessage(Message(matchUser.otherUser.id, 'from the hot girl')
      ..sender = MessageSender.other);
    matchUser.addMessage(Message(matchUser.otherUser.id, 'from the hot girl')
      ..sender = MessageSender.other);
    matchUser.addMessage(Message(matchUser.otherUser.id, 'from the hot girl')
      ..sender = MessageSender.other);
    matchUser.addMessage(Message(matchUser.otherUser.id, 'from the hot girl')
      ..sender = MessageSender.other);
    matchUser.addMessage(Message(matchUser.otherUser.id, 'from the hot girl')
      ..sender = MessageSender.other);
    matchUser.addMessage(
        Message(me.id, 'from the hot girl')..sender = MessageSender.me);
    matchUser.addMessage(Message(matchUser.otherUser.id, 'from the hot girl')
      ..sender = MessageSender.other);
    matchUser.addMessage(
        Message(me.id, 'from the hot girl')..sender = MessageSender.me);
    matchUser.addMessage(
        Message(me.id, 'from the hot girl')..sender = MessageSender.me);
    matchUser.addMessage(Message(matchUser.otherUser.id, 'from the hot girl')
      ..sender = MessageSender.other);
    matchUser.addMessage(Message(matchUser.otherUser.id, 'from the hot girl')
      ..sender = MessageSender.other);
    matchUser.addMessage(
      Message(me.id, 'from the hot girl')
        ..sender = MessageSender.me
        ..created = DateTime.now().add(
          const Duration(
            days: 1,
          ),
        ),
    );

    matchUser.addMessage(
      Message(me.id, 'from the hot girl!!!')
        ..sender = MessageSender.me
        ..created = DateTime.now().add(
          const Duration(
            days: 3,
          ),
        ),
    );

    matchUser.addMessage(
      Message(me.id, 'from the hot gir???l!!!')
        ..sender = MessageSender.me
        ..created = DateTime.now().add(
          const Duration(
            days: 5,
          ),
        ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _myController.jumpTo(_myController.position.maxScrollExtent);
    });
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage(
                    'https://images.pexels.com/photos/3225229/pexels-photo-3225229.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
              ),
            ),
            Text(
              'Celine',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: const [Icon(Icons.video_chat), Icon(Icons.shield)],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              matchUser.messages.isNotEmpty
                  ? Expanded(
                      child: ListView.builder(
                        controller: _myController,
                        shrinkWrap: false,
                        itemCount: matchUser.messages.length,
                        itemBuilder: ((context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: createBubbble(matchUser.messages[index]),
                          );
                        }),
                      ),
                    )
                  : Expanded(
                      child: Container(),
                    ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: CircleAvatar(
                        radius: 25.0,
                        child: Icon(Icons.gif),
                      ),
                    ),
                    messageTextbox()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget messageBubbleOwn(Message message) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2.5),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(4.0)),
      ),
      child: Text(message.message),
    );
  }

  Widget messageBubbleOwnFollowUp(Message message) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2.5),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(4.0),
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(4.0)),
      ),
      child: Text(message.message),
    );
  }

  Widget messageBubbleMatch(Message messag) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2.5),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
          bottomLeft: Radius.circular(4.0),
        ),
      ),
      child: Text(messag.message),
    );
  }

  Widget messageBubbleMatchFollowUp(Message message) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2.5),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(4.0),
          topRight: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
          bottomLeft: Radius.circular(4.0),
        ),
      ),
      child: Text(message.message),
    );
  }

  Widget messageTextbox() {
    return Expanded(
      child: TextFormField(
        controller: _messageController,
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('SEND', textAlign: TextAlign.center),
                ],
              ),
            ),
            onTap: () => {_sendMessage(_messageController.text)},
          ),
          hintText: 'Type a message...',
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(25),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }

  _sendMessage(String text) {
    setState(() {
      var newMessage = Message(me.id, text)..sender = MessageSender.me;
      matchUser.addMessage(newMessage);
      _messageController.text = "";
    });
  }

  Widget timeLine(Message message) {
    final DateFormat formatter = DateFormat('dd.MM.yyyy HH:mm');
    final String formatted = formatter.format(message.created);
    if (message.isNewDate) {
      return Text(formatted);
    } else {
      return Container();
    }
  }

  Widget createBubbble(Message message) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Align(
          alignment: Alignment.center,
          child: timeLine(message),
        ),
        buildMessage(message)
      ],
    );
  }

  Widget buildMessage(Message message) {
    if (message.owner == me.id) {
      if (message.isFollowUpMessage) {
        return Padding(
          padding: const EdgeInsets.only(left: 42.0),
          child: messageBubbleOwnFollowUp(message),
        );
      } else {
        return Padding(
          padding: const EdgeInsets.only(left: 42.0),
          child: messageBubbleOwn(message),
        );
      }
    } else {
      if (message.isFollowUpMessage) {
        return Padding(
          padding: const EdgeInsets.only(right: 42.0),
          child: messageBubbleMatchFollowUp(message),
        );
      } else {
        return Padding(
          padding: const EdgeInsets.only(right: 42.0),
          child: messageBubbleMatch(message),
        );
      }
    }
  }
}
