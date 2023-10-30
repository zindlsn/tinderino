import 'package:flutter/material.dart';
import 'package:tinder_clone/main.dart';
import 'package:tinder_clone/models/match_user.dart';
import 'package:tinder_clone/models/message.dart';

class MatchChatPage extends StatefulWidget {
  MatchUser matchUser;
  MatchChatPage(this.matchUser, {super.key});

  @override
  State<MatchChatPage> createState() => _MatchChatPageState();
}

class _MatchChatPageState extends State<MatchChatPage> {
  final _messageController = TextEditingController();
  late MatchUser matchUser;
  @override
  void initState() {
    matchUser = widget.matchUser;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              const Text('----- 13.02.2023 -----'),
              Align(
                  alignment: Alignment.centerRight, child: messageBubbleOwn()),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Align(
                    alignment: Alignment.centerRight,
                    child: messageBubbleOwnFollowUp(context)),
              ),
              Align(
                  alignment: Alignment.centerLeft, child: messageBubbleMatch()),
              Align(
                  alignment: Alignment.centerLeft,
                  child: messageBubbleMatchFollowUp()),
              const Spacer(),
              Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: CircleAvatar(
                        radius: 25.0,
                        child: Icon(Icons.gif),
                      ),
                    ),
                    Expanded(child: messageTextbox())
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget messageBubbleOwn() {
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
      child: const Text('Ninna?'),
    );
  }

  Widget messageBubbleOwnFollowUp(BuildContext context) {
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
      child: const Text(
          'Nina, that is a long text to go until you reach the endpint?'),
    );
  }

  Widget messageBubbleMatch() {
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
      child: const Text('Ninna?'),
    );
  }

  Widget messageBubbleMatchFollowUp() {
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
      child: const Text('Ninna?'),
    );
  }

  Widget messageTextbox() {
    return TextFormField(
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
    );
  }

  _sendMessage(String text) {
    setState(() {
      var newMessage = Message(me.id, text);
      matchUser.messages.add(newMessage);
      _messageController.text = "";
    });
  }
}
