import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:tinder_clone/login_page.dart';
import 'package:tinder_clone/matches_page.dart';
import 'package:tinder_clone/matching_page.dart';
import 'package:tinder_clone/profile_page.dart';
import 'package:tinder_clone/models/user.dart';

User me = User();

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      tools: const [
        ...DevicePreview.defaultTools,
      ],
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tinderino',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: selectCurrentPage(_currentIndex),
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        elevation: 1.0,
        iconSize: 32,
        enableFeedback: true,
        currentIndex: _currentIndex,
        onTap: (value) => _onItemTapped(value),
        items: const [
          BottomNavigationBarItem(
            tooltip: 'View Tinder Profiles',
            activeIcon: Icon(
              Icons.local_fire_department,
              color: Colors.red,
            ),
            label: 'Home',
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Icon(
                    Icons.local_fire_department,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          BottomNavigationBarItem(
            label: 'Explore',
            icon: Icon(
              Icons.travel_explore,
              color: Colors.grey,
            ),
            activeIcon: Icon(
              Icons.travel_explore,
              color: Colors.red,
            ),
          ),
          BottomNavigationBarItem(
            label: '2',
            icon: Icon(
              Icons.diamond,
              color: Colors.grey,
            ),
            activeIcon: Icon(
              Icons.diamond,
              color: Colors.red,
            ),
          ),
          BottomNavigationBarItem(
            label: '2',
            icon: Icon(
              Icons.forum,
              color: Colors.grey,
            ),
            activeIcon: Icon(
              Icons.forum,
              color: Colors.red,
            ),
          ),
          BottomNavigationBarItem(
            label: '2',
            icon: Icon(
              Icons.person_2,
              color: Colors.grey,
            ),
            activeIcon: Icon(
              Icons.person_2,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  selectCurrentPage(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return const MatchingPage();
      case 3:
        return const MatchesPage();
      case 4:
        return const ProfilePage();
      default:
        return const MatchingPage();
    }
  }
}
