import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final String label;
  const InputField({super.key, required this.label});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 18.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: const TextStyle(
            color: Colors.red,
          ),
          focusColor: Colors.red,
        ),
      ),
    );
  }
}
