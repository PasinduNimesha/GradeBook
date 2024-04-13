import 'package:flutter/material.dart';

class NavCard extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const NavCard({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
      onTap: onPressed,
    );
  }
}
