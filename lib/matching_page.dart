import 'package:flutter/material.dart';
import 'package:tinder_clone/appbar_title.dart';

class MatchingPage extends StatefulWidget {
  const MatchingPage({super.key});

  @override
  MatchingPageState createState() => MatchingPageState();
}

class MatchingPageState extends State<MatchingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.notifications_sharp,
                  size: 32,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(
                    Icons.display_settings_outlined,
                    size: 32,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 4.0, left: 4.0, right: 4.0),
        child: Center(
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                    "https://images.pexels.com/photos/3225229/pexels-photo-3225229.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
              ),
              const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ShortProfileInfos(),
                  PictureActions(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ShortProfileInfos extends StatelessWidget {
  const ShortProfileInfos({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          stops: [0.4, 1.0],
          colors: <Color>[Colors.black, Colors.transparent],
        ),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    'Stefan',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      '32',
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: Colors.white,
                    ),
                    Row(
                      children: [
                        Text(
                          '10 Miles away',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PictureActions extends StatelessWidget {
  const PictureActions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(8), bottomLeft: Radius.circular(8))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(width: 2, color: Colors.yellowAccent),
              ),
              child: const Icon(
                Icons.autorenew,
                color: Colors.yellow,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(width: 2, color: Colors.redAccent),
              ),
              child: const Icon(
                Icons.cancel,
                color: Colors.red,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(width: 2, color: Colors.blueAccent),
              ),
              child: const Icon(
                Icons.star,
                color: Colors.blue,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(width: 2, color: Colors.greenAccent),
              ),
              child: const Icon(
                Icons.favorite,
                color: Colors.green,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(width: 2, color: Colors.purpleAccent),
              ),
              child: const Icon(
                Icons.bolt,
                color: Colors.purple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
