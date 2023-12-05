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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [mediaPart(), aboutMe(), getInteresets()],
            ),
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
    String enteredText = 'Kletterer';
    TextEditingController _aboutMeController = TextEditingController();
    _aboutMeController.text = enteredText;
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getHeader('About Me'),
          TextFormField(
            controller: _aboutMeController,
            onChanged: (value) {
              enteredText = value;
            },
            decoration: InputDecoration(
              counter: Text('${enteredText.length.toString()} / 255'),
              border: InputBorder.none,
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 400,
          child: GridView.count(
            primary: false,
            crossAxisCount: 3,
            childAspectRatio: (1),
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            children: List.generate(
              9,
              (index) {
                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                        child: Image.network(
                          'https://images.pexels.com/photos/3225229/pexels-photo-3225229.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Positioned(
                      right: -10,
                      bottom: -20,
                      child: Align(
                        alignment: AlignmentDirectional.bottomEnd,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border:
                                  Border.all(width: 2, color: Colors.white)),
                          child: IconButton(
                            icon: const Icon(
                              Icons.cancel,
                              color: Colors.white,
                            ),
                            onPressed: () => {},
                          ),
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
