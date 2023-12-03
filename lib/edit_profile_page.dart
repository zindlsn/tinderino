import 'package:flutter/material.dart';
import 'package:tinder_clone/interests_page.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [mediaPart(), aboutMe(), getInteresets()],
          ),
        ),
      ),
    );
  }

  Widget mediaPart() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          mediaSection(),
        ],
      ),
    );
  }

  Widget aboutMe() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          getHeader('About Me'),
          TextFormField(
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Username',
            ),
          ),
        ],
      ),
    );
  }

  Widget getHeader(String text) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: const TextStyle(fontWeight: FontWeight.bold),
    );
  }

  Widget getInteresets() {
    return Column(
      children: [
        getHeader('Interests'),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const InterestsPage(),
              ),
            );
          },
          child: const Text('Interests'),
        ),
      ],
    );
  }

  Widget mediaSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getHeader('Media'),
        SizedBox(
          height: 450,
          child: GridView.count(
            primary: false,
            crossAxisCount: 3,
            mainAxisSpacing: 16,
            crossAxisSpacing: 4,
            children: List.generate(
              9,
              (index) {
                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                      child: Image.network(
                          'https://images.pexels.com/photos/3225229/pexels-photo-3225229.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
                    ),
                    const Positioned(
                      right: 32,
                      bottom: -14,
                      child: Align(
                        alignment: AlignmentDirectional.bottomEnd,
                        child: Icon(
                          Icons.cancel,
                          size: 34,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
