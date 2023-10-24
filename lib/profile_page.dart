import 'package:flutter/material.dart';
import 'package:tinder_clone/appbar_title.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(),
        actions: const [
          Icon(
            Icons.security,
            size: 32,
          ),
          Icon(
            Icons.settings,
            size: 32,
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            color: Colors.blue,
            child: Center(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  const FilledProfileProgress(),
                  const Positioned(
                    child: EditProfileButton(),
                    top: 60.0,
                    right: 100,
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 3,
                color: Colors.grey[200],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: SizedBox(
        height: 70,
        width: 70,
        child: Stack(
          children: [
            Positioned(
              top: 0.0,
              child: Container(
                constraints:
                    const BoxConstraints(maxHeight: 50.0, maxWidth: 50.0),
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(color: Color(0xFFdedede), offset: Offset(2, 2)),
                  ],
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: GestureDetector(
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.edit,
                      size: 34,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FilledProfileProgress extends StatefulWidget {
  const FilledProfileProgress({Key? key}) : super(key: key);

  @override
  _FilledProfileProgressState createState() => _FilledProfileProgressState();
}

class _FilledProfileProgressState extends State<FilledProfileProgress> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 8,
            color: Colors.red,
            style: BorderStyle.solid,
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(child: ProfilePart()),
        ),
      ),
    );
  }
}

class ProfilePart2 extends StatelessWidget {
  const ProfilePart2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xff2577ff),
          width: 5.0,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      width: 200.0,
      height: 160.0,
      child: LayoutBuilder(
        builder: (context, constraint) {
          return Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                // <-- doesn't work
                top: -(constraint.maxHeight / 4), // relative to parent's height
                right:
                    -(constraint.maxHeight / 4), // relative to parent's height
                child: Container(
                  height:
                      constraint.maxHeight / 2, // relative to parent's height
                  width:
                      constraint.maxHeight / 2, // relative to parent's height
                  child: const Icon(Icons.edit),
                ),
              ),
              Container(
                child: Center(
                    child: Image.network(
                        'https://images.pexels.com/photos/3225229/pexels-photo-3225229.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2')),
              )
            ],
          );
        },
      ),
    );
  }
}

class ProfilePart extends StatelessWidget {
  const ProfilePart({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) => Container(
        constraints: const BoxConstraints(maxHeight: 200.0, maxWidth: 200.0),
        padding: const EdgeInsets.only(left: 16.0, bottom: 8.0, right: 16.0),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: NetworkImage(
                'https://images.pexels.com/photos/3225229/pexels-photo-3225229.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
            fit: BoxFit.cover,
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
