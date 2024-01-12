import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:tinder_clone/core/custom_formfield.dart';
import 'package:tinder_clone/interests_page.dart';
import 'package:tinder_clone/main.dart';

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
              children: [
                mediaPart(),
                AboutMeSection(),
                getInteresets(),
                HeigtSection()
              ],
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

  Widget getHeader(String text) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: const TextStyle(fontWeight: FontWeight.bold),
    );
  }

  String _interests = "b";

  Widget getInteresets() {
    return Column(
      children: [
        getHeader('Interests'),
        GestureDetector(
          onTap: () async {
            List<String>? result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const InterestsPage(),
              ),
            );
            setState(() {
              if (result != null) {
                _interests = result.join(', ');
              }
            });
          },
          child: Text(_interests),
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

class AboutMeSection extends StatefulWidget {
  AboutMeSection({Key? key}) : super(key: key);

  @override
  _AboutMeSectionState createState() => _AboutMeSectionState();
}

class _AboutMeSectionState extends State<AboutMeSection> {
  final TextEditingController _aboutMeController = TextEditingController();
  final maxLength = 12;
  late int rest = maxLength;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return aboutMe();
  }

  Widget getHeader(String text) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: const TextStyle(fontWeight: FontWeight.bold),
    );
  }

  String enteredText = '';

  Widget aboutMe() {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getHeader('About Me'),
          TextFormField(
            controller: _aboutMeController,
            onChanged: (value) => setState(() {
              rest = maxLength - _aboutMeController.text.length;
            }),
            minLines: 1,
            maxLines: 5,
            maxLength: maxLength,
            decoration: InputDecoration(
              counter: Text(
                '$rest',
                overflow: TextOverflow.ellipsis,
              ),
              border: InputBorder.none,
            ),
          ),
          const Text(
            'data',
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}

class HeigtSection extends StatefulWidget {
  HeigtSection({Key? key}) : super(key: key);

  @override
  _HeigtSectionState createState() => _HeigtSectionState();
}

class _HeigtSectionState extends State<HeigtSection> {
  final _pickerData2 = '''
[
    [
        1,
        2,
        3,
        4
    ],
    [
        11,
        22,
        33,
        44
    ],
    [
        "aaa",
        "bbb",
        "ccc"
    ]
]
    ''';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        children: [
          Icon(Icons.height),
          const Text('Add height'),
        ],
      ),
      onTap: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return SizedBox(
              height: 400,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text('Height'),
                    const Text('Here`s a change to add height to your profile'),
                    const UnitTypeSection(),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Remove height'),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class UnitTypeSection extends StatefulWidget {
  const UnitTypeSection({super.key});

  @override
  State<UnitTypeSection> createState() => _UnitTypeSectionState();
}

class _UnitTypeSectionState extends State<UnitTypeSection> {
  final List<bool> _toggleButtonsSelection =
      UnitType.values.map((UnitType e) => e == UnitType.medium).toList();
  Set<UnitType> _segmentedButtonSelection = <UnitType>{UnitType.medium};
  TextEditingController feetEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _segmentedButtonSelection.contains(UnitType.feet)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const Text('Feet'),
                        CustomFormfield(
                          hintText: 'ft',
                          textEditingController: feetEditingController,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const Text('Inches'),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextFormField(),
                        ),
                      ],
                    ),
                  )
                ],
              )
            : Column(
                children: [
                  const Text('Centimeters'),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextFormField(),
                  ),
                ],
              ),
        SegmentedButton<UnitType>(
          // ToggleButtons above allows multiple or no selection.
          // Set `multiSelectionEnabled` and `emptySelectionAllowed` to true
          // to match the behavior of ToggleButtons.
          multiSelectionEnabled: false,
          emptySelectionAllowed: false,
          // Hide the selected icon to match the behavior of ToggleButtons.
          showSelectedIcon: false,
          // SegmentedButton uses a Set<T> to track its selection state.
          selected: _segmentedButtonSelection,
          // This callback updates the set of selected segment values.
          onSelectionChanged: (Set<UnitType> newSelection) {
            setState(() {
              _segmentedButtonSelection = newSelection;
            });
          },
          segments: shirtSizeOptions
              .map<ButtonSegment<UnitType>>(((UnitType, String) shirt) {
            return ButtonSegment<UnitType>(
                value: shirt.$1, label: Text(shirt.$2));
          }).toList(),
        ),
      ],
    );
  }
}

enum UnitType { feet, metric, medium, large, extraLarge }

const List<(UnitType, String)> shirtSizeOptions = <(UnitType, String)>[
  (UnitType.feet, 'ft/in'),
  (UnitType.metric, 'cm'),
];
