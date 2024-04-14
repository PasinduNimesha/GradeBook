import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final String label;
  final bool obscureText;
  final ValueChanged<String>? onPressed;
  const InputField({super.key, required this.label, required this.onPressed, this.obscureText = false});

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
        onChanged: widget.onPressed,
        obscureText: widget.obscureText,
      ),
    );
  }
}
