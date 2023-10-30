import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tinder_clone/main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Flexible(
              flex: 1,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.local_fire_department,
                          color: Colors.white,
                        ),
                        Text(
                          'Tinderino',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      'It Starts with a Swipe',
                      style: TextStyle(color: Colors.white, fontSize: 48),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 32.0, right: 32.0),
                child: IntrinsicWidth(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          'By clicking Log In, you agree with our Terms. Learn how we process your data in our Privacy Policy and Coodies Policy.',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      LoginButton('LOG IN WITH GOOGLE', login),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                        child: LoginButton('LOG IN WITH FACEBOOK', login),
                      ),
                      LoginButton('LOG IN WITH PHONE NUMBER', login),
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 32.0),
                          child: Text(
                            'Trouble logging in?',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future loginAsync() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MyHomePage(
          title: '',
        ),
      ),
    );
  }

  void login() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const MyHomePage(
          title: '',
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback callback;
  LoginButton(this.buttonText, this.callback, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        height: 48,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(25.0))),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 32.0, right: 32.0, top: 8.0, bottom: 8.0),
          child: Center(
            child: Text(buttonText),
          ),
        ),
      ),
    );
  }
}
