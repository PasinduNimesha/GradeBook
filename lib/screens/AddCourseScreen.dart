import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grade_book/components/InputField.dart';

class AddCourseScreen extends StatefulWidget {
  const AddCourseScreen({super.key});

  @override
  State<AddCourseScreen> createState() => _AddCourseScreenState();
}

class _AddCourseScreenState extends State<AddCourseScreen> {
  String _courseName = '';
  String _courseCode = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Course'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              InputField(label: "Enter Course Name", onPressed: (value) {
                setState(() {
                  _courseName = value;
                });
              },
              ),
              InputField(label: "Enter Course Code", onPressed: (value) {
                setState(() {
                  _courseCode = value;
                });
              },
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: () {
                addCourse();
                }, child: const Text('Add Course')
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addCourse() {
    FirebaseFirestore.instance.collection('courses').add({
      'name': _courseName,
      'code': _courseCode,
    }).then((value) {
      showDialog(context: context, builder: (context) {
        return AlertDialog(
          title: const Text('Course Added'),
          content: const Text('Course has been added successfully'),
          actions: [
            TextButton(onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
              }, child: const Text('OK'))
          ],
        );
      });
    });
  }
}
