import 'package:flutter/material.dart';

class NavCard extends StatelessWidget {
  final VoidCallback onPressed;
  const NavCard({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onTap: onPressed,
    );
  }
}
