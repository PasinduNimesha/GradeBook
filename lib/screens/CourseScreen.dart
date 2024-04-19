import 'package:cloud_firestore/cloud_firestore.dart';
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
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('courses').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Error fetching data'));
          }
          final courses = snapshot.data!.docs;
          if (courses.isEmpty) {
            return const Center(child: Text('No courses found'));
          }
          return Center(
            child: Column(
              children: courses.map((course) {
                final data = course.data() as Map<String, dynamic>;
                final code = data['code'];
                final name = data['name'];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LargeButton(
                    name: name,
                    code: code,
                    onTap: () {
                      // Handle button tap, e.g., navigate to course details screen
                    },
                  ),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
