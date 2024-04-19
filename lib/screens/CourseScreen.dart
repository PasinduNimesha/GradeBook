import 'package:flutter/material.dart';
import 'package:grade_book/components/LargeButton.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            LargeButton(name: 'Mathematics', code: 'MATH101', onTap: () {}),
          ],
        ),
      ),
    );
  }
}
