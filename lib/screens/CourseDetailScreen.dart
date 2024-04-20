import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CourseDetailScreen extends StatefulWidget {
  final String documentID;

  const CourseDetailScreen({super.key, required this.documentID});

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  int totalStudents = 0;
  double averageMarks = 0.0;

  @override
  void initState() {
    super.initState();
    _calculateCourseDetails();
  }

  Future<void> _calculateCourseDetails() async {
    try {
      final marksSnapshot = await FirebaseFirestore
          .instance
          .collection('marks')
          .where('courseID', isEqualTo: FirebaseFirestore.instance.doc('/courses/${widget.documentID}'))
          .get();
      int totalMarks = 0;
      totalStudents = marksSnapshot.docs.length;

      for (final doc in marksSnapshot.docs) {
        final data = doc.data();
        final marks = data['marks'] as int;
        totalMarks += marks;
      }

      averageMarks = totalMarks / totalStudents;

      // Update the course details in Firestore
      await FirebaseFirestore.instance.collection('courses').doc(widget.documentID).update({
        'total_students': totalStudents,
        'average_marks': averageMarks,
      });

      setState(() {}); // Update UI with new values
    } catch (error) {
      print('Error calculating course details: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Details Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Text('Total Students: $totalStudents'),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Text('Average Marks: ${averageMarks.toStringAsFixed(2)}'),
            ),
          ],
        ),
      ),
    );
  }
}
