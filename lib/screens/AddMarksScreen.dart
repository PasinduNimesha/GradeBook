import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grade_book/components/InputField.dart';

class AddMarksScreen extends StatefulWidget {
  final String courseID;
  const AddMarksScreen({super.key, required this.courseID});

  @override
  State<AddMarksScreen> createState() => _AddMarksScreenState();
}

class _AddMarksScreenState extends State<AddMarksScreen> {
  String _studentUsername = '';
  int _marks = 0;
  int _term = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Marks'),
      ),
      body: Center(
        child: Column(
          children: [
            InputField(label: "Student Username", onPressed: (value) {
              setState(() {
                _studentUsername = value;
              });
            }, ),
            InputField(label: "Marks", onPressed: (value) {
              setState(() {
                _marks = int.parse(value);
              });
            }, ),
            InputField(label: "Term", onPressed: (value) {
              setState(() {
                _term = int.parse(value);
              });
            }, ),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              addMarks();
              }, child: const Text('Add Marks')),
          ],
        ),
      ),
    );
  }

  void addMarks() async {
    try {
      await FirebaseFirestore.instance.collection('students').where(
          'username', isEqualTo: _studentUsername).get().then((value) {
        final studentID = value.docs[0].id;
        print(studentID);
        if (value.docs.isNotEmpty) {
          FirebaseFirestore.instance.collection('marks').add({
            'studentID': FirebaseFirestore.instance.doc('/students/$studentID'),
            'courseID': FirebaseFirestore.instance.doc(
                '/courses/${widget.courseID}'),
            'marks': _marks,
            'term': _term,
          }).then((value) {
            showDialog(context: context, builder: (context) {
              return AlertDialog(
                title: const Text('Success'),
                content: const Text('Marks added successfully'),
                actions: [
                  TextButton(onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  }, child: const Text('OK'))
                ],
              );
            });
          }).onError((error, stackTrace) {
            print('Error adding marks: $error');
          });
        }
      });
    } on RangeError {
      showDialog(context: context, builder: (context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text('Student with username $_studentUsername not found'),
          actions: [
            TextButton(onPressed: () {
              Navigator.of(context).pop();
            }, child: const Text('OK'))
          ],
        );
      });
    } catch (error) {
      print('Error adding marks: $error');
    }
  }
}
