import 'package:flutter/material.dart';

class InterestsPage extends StatefulWidget {
  const InterestsPage({super.key});

  @override
  State<InterestsPage> createState() => _InterestsPageState();
}

class _InterestsPageState extends State<InterestsPage> {
  List<String> _dynamicChips = [
    'Health',
    'Food',
    'Nature',
    'Health',
    'Food',
    'Nature',
    'Health',
    'Food',
    'Nature',
    'Health',
    'Food',
    'Nature',
    'Health',
    'Food',
    'Nature',
    'Health',
    'Food',
    'Nature',
    'Health',
    'Food',
    'Nature',
  ];

  List<String> _selectedInterests = ['selected1'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Icon(Icons.cancel),
      SearchBar(
        trailing: [Icon(Icons.search)],
      ),
      Divider(),
      selectedchips(),
      newMethod(),
    ]));
  }

  Widget selectedchips() {
    return Wrap(
        children: List<Widget>.generate(_dynamicChips.length, (int index) {
      return FilterChip(
          label: Text(_dynamicChips[index]),
          onSelected: (value) => setState(() {
                value
                    ? _selectedInterests.add(_dynamicChips[index])
                    : _selectedInterests.removeWhere(
                        (element) => element == _dynamicChips[index]);
              }));
    }));
  }

  Widget newMethod() {
    return Wrap(
      spacing: 6.0,
      runSpacing: 6.0,
      runAlignment: WrapAlignment.center,
      children: List<Widget>.generate(_dynamicChips.length, (int index) {
        return FilterChip(
          label: Text(_dynamicChips[index]),
          onSelected: (bool selected) => setState(
            () {
              selected
                  ? _selectedInterests.add(_dynamicChips[index])
                  : _selectedInterests.removeWhere(
                      (element) => element == _dynamicChips[index]);
            },
          ),
        );
      }),
    );
  }
}
/*
https://vipinvijayannair.medium.com/wrap-widget-chip-widgets-in-flutter-dddddec936d3
*/