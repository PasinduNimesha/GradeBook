import 'package:flutter/material.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Screen'),
      ),
      body: const Center(
        child: Text('Course Screen'),
      ),
    );
  }
}
