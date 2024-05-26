import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final String label;
  final bool obscureText;
  final String? defaultValue;
  final TextInputType keyboardType;
  final ValueChanged<String>? onPressed;

  const InputField({super.key, required this.label, required this.onPressed, this.obscureText = false, this.defaultValue, this.keyboardType = TextInputType.text});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.defaultValue ?? ''); // Set default value to the controller
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 18.0),
      child: TextField(
        controller: _controller, // Assign controller to the TextField
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: const TextStyle(
            color: Colors.red,
          ),
          focusColor: Colors.red,
        ),
        keyboardType: widget.keyboardType,
        onChanged: widget.onPressed,
        obscureText: widget.obscureText,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller when the widget is disposed
    super.dispose();
  }
}
