import 'package:flutter/material.dart';

class CustomFormfield extends StatefulWidget {
  TextEditingController textEditingController;
  String hintText;
  CustomFormfield(
      {super.key, required this.textEditingController, required this.hintText});

  @override
  State<CustomFormfield> createState() => _CustomFormfieldState();
}

class _CustomFormfieldState extends State<CustomFormfield> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditingController,
      decoration: InputDecoration(
          labelText: widget.hintText,
          // Set border for enabled state (default)
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 3, color: Colors.grey),
            borderRadius: BorderRadius.circular(5),
          ),
          // Set border for focused state
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 3, color: Colors.grey),
            borderRadius: BorderRadius.circular(5),
          )),
    );
  }
}
