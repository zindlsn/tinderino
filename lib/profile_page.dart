import 'dart:math';

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
          Flexible(
            flex: 1,
            child: Container(
              color: Colors.grey[300],
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: Stack(
                      alignment: const Alignment(0, 2),
                      children: [
                        Center(
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              const SizedBox(
                                  height: 180,
                                  width: 180,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 8.0,
                                        bottom: 8.0,
                                        left: 8.0,
                                        right: 8.0),
                                    child: Profile(),
                                  )),
                              const Positioned(
                                top: 0.0,
                                right: 0,
                                child: EditProfileButton(),
                              ),
                              Positioned(
                                bottom: 0.0,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(32)),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.only(
                                        top: 8.0,
                                        bottom: 8.0,
                                        left: 32,
                                        right: 32.0),
                                    child: Text(
                                      '60% COMPLETE',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Stefan, 32',
                      style: TextStyle(fontSize: 24),
                    ),
                  )
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              color: Colors.white24,
            ),
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
  const FilledProfileProgress({super.key});

  @override
  // ignore: library_private_types_in_public_api
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

class ProfilePart extends StatelessWidget {
  const ProfilePart({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) => Container(
        constraints: const BoxConstraints(maxHeight: 150.0, maxWidth: 150.0),
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

class BorderPainter extends CustomPainter {
  final double currentState;

  BorderPainter({required this.currentState});

  @override
  void paint(Canvas canvas, Size size) {
    double strokeWidth = 8;
    Rect rect = const Offset(0, 0) & Size(size.width, size.height);

    var paint = Paint()
      ..color = Colors.red
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    double startAngle = pi / 2;
    double sweepAmount = currentState * pi * 2 / 100 * 75;

    canvas.drawArc(rect, startAngle, sweepAmount, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      color: Colors.transparent,
      child: Center(
        child: TweenAnimationBuilder(
          curve: Curves.bounceOut,
          tween: Tween(begin: 0.0, end: 1.0),
          duration: const Duration(seconds: 2),
          builder: (context, value, child) {
            return CustomPaint(
              painter: BorderPainter(currentState: value),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(child: ProfilePart()),
              ),
            );
          },
        ),
      ),
    );
  }
}
