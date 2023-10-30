import 'package:flutter/material.dart';
import 'package:tinder_clone/appbar_title.dart';
import 'package:tinder_clone/match_chat_page.dart';
import 'package:tinder_clone/models/match_user.dart';
import 'package:tinder_clone/models/user.dart';

class MatchesPage extends StatefulWidget {
  const MatchesPage({super.key});

  @override
  State<MatchesPage> createState() => _MatchesPageState();
}

class _MatchesPageState extends State<MatchesPage> {
  var matches = [];

  @override
  void initState() {
    super.initState();
    var matchUser = User()
      ..mainProfilepicture =
          'https://images.pexels.com/photos/3225229/pexels-photo-3225229.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'
      ..name = 'Claire';
    var match1 = MatchUser(matchUser);
    match1.messages = [];

    matches = [match1, MatchUser(matchUser)];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Scaffold(
        appBar: AppBar(
          title: const AppBarTitle(),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Messags',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return matchElement(matches[index]);
                      },
                      itemCount: matches.length),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget matchElement(MatchUser matchUser) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MatchChatPage(matchUser),
          ),
        );
      },
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage:
                          NetworkImage(matchUser.otherUser.mainProfilepicture),
                    )
                  ],
                ),
              ),
              Text(
                matchUser.otherUser.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Divider(
            height: 5,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
