import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CourseDetailsscreen extends StatefulWidget {
  const CourseDetailsscreen({super.key});

  @override
  State<CourseDetailsscreen> createState() => _CourseDetailsscreenState();
}

class _CourseDetailsscreenState extends State<CourseDetailsscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Details Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Course Details Screen'),
          ],
        ),
      ),
    );
  }
}
