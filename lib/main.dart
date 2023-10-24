import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:tinder_clone/matching_page.dart';
import 'package:tinder_clone/profile_page.dart';

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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Tinderino'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Icon(
              Icons.local_fire_department,
              color: Colors.red,
            ),
            Text(
              widget.title,
              style: const TextStyle(color: Colors.red),
            ),
          ],
        ),
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
      body: const MatchingPage(),
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
          ),
          BottomNavigationBarItem(
            label: '2',
            icon: Icon(
              Icons.diamond,
              color: Colors.grey,
            ),
          ),
          BottomNavigationBarItem(
            label: '2',
            icon: Icon(
              Icons.forum,
              color: Colors.grey,
            ),
          ),
          BottomNavigationBarItem(
            label: '2',
            icon: Icon(
              Icons.person_2,
              color: Colors.grey,
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

    switch (index) {
      case 0:
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => MatchingPage()));
        break;
      case 1:
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => ProfilePage()));
        break;
    }
  }
}
