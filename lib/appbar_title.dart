import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.local_fire_department,
          color: Colors.red,
        ),
        Text(
          'Tinderino',
          style: const TextStyle(color: Colors.red),
        ),
      ],
    );
  }
}
