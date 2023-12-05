import 'package:flutter/material.dart';
import 'package:tinder_clone/main.dart';

class InterestsPage extends StatefulWidget {
  const InterestsPage({super.key});

  @override
  State<InterestsPage> createState() => _InterestsPageState();
}

class _InterestsPageState extends State<InterestsPage> {
  final List<String> _dynamicChips = [
    'Health',
    'Food',
    'Nature',
    'Ice Cream',
    'Football',
    'Climbing',
    'Surfing'
  ];

  final List<String> _selectedInterests = [];
  List<String> _filteredChips = [];

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    _filteredChips = _dynamicChips;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: const [
            Text(
              'Done',
              style: TextStyle(color: Colors.redAccent),
            ),
          ],
        ),
        body: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('Interests'),
            selectedchips(),
            SearchBar(
              controller: _searchController,
              leading: _searchController.text.isNotEmpty
                  ? GestureDetector(
                      child: const Icon(Icons.cancel),
                      onTap: () {
                        setState(() {
                          _searchController.text = '';
                          _filteredChips = _dynamicChips;
                        });
                      },
                    )
                  : null,
              onChanged: _filterChips,
              hintText: 'Suchen',
              trailing: const [
                Icon(Icons.search),
              ],
            ),
            listAllInterests(),
          ]),
        ));
  }

  void _filterChips(String searchText) {
    setState(() {
      if (searchText.isEmpty) {
        _filteredChips = _dynamicChips;
        return;
      }
      _filteredChips = _dynamicChips
          .where(
              (chip) => chip.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    });
  }

  Widget selectedchips() {
    return Wrap(
        children: List<Widget>.generate(_selectedInterests.length, (int index) {
      return FilterChip(
          color: MaterialStateProperty.all(Colors.grey),
          label: Text(
            _selectedInterests[index],
            style: TextStyle(foreground: Paint()..color = Colors.white),
          ),
          onSelected: (value) => setState(() {
                _selectedInterests.removeWhere(
                    (element) => element == _selectedInterests[index]);
              }));
    }));
  }

  Widget listAllInterests() {
    return Wrap(
      spacing: 6.0,
      runSpacing: 6.0,
      runAlignment: WrapAlignment.center,
      children: List<Widget>.generate(_filteredChips.length, (int index) {
        return FilterChip(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide(
              color: isSelected(_filteredChips[index])
                  ? Colors.redAccent
                  : Colors.grey,
              width: 2.0,
            ),
          ),
          label: Text(_filteredChips[index]),
          selected: isSelected(_filteredChips[index]),
          onSelected: (bool selected) => setState(
            () {
              !isSelected(_filteredChips[index])
                  ? {
                      if (_selectedInterests.length > 4)
                        {
                          selected = false,
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('5 interestes are enough'),
                            ),
                          ),
                        }
                      else
                        {
                          _selectedInterests.add(_filteredChips[index]),
                        }
                    }
                  : _selectedInterests.removeWhere(
                      (element) => element == _filteredChips[index]);
            },
          ),
        );
      }),
    );
  }

  bool isSelected(String dynamicChip) =>
      _selectedInterests.contains(dynamicChip);
}
/*
https://vipinvijayannair.medium.com/wrap-widget-chip-widgets-in-flutter-dddddec936d3
*/