import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:grade_book/components/InputField.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({super.key});

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  String _firstName = '';
  String _lastName = '';
  String _email = '';
  String _phone = '';
  String _address = '';
  int _age = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Student Screen'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              InputField(label: "First Name", onPressed: (String value) {
                setState(() {
                  _firstName = value;
                });
              },),
              InputField(label: "Last Name", onPressed: (String value) {
                setState(() {
                  _lastName = value;
                });
              },),
              InputField(label: "Email", onPressed: (String value) {
                setState(() {
                  _email = value;
                });
              },),
              InputField(label: "Phone", onPressed: (String value) {
                setState(() {
                  _phone = value;
                });
              },),
              InputField(label: "Address", onPressed: (String value) {
                setState(() {
                  _address = value;
                });
              },),
              InputField(label: "Age", onPressed: (String value) {
                setState(() {
                  _age = int.parse(value);
                });
              },),
              ElevatedButton(onPressed: () {
                handleAddStudent();
              }, child: const Text('Add Student')),
            ],
          ),
        ),
      ),
    );
  }
  void handleAddStudent() async {
    FirebaseFirestore.instance.collection('students').add({
      'first_name': _firstName,
      'last_name': _lastName,
      'email': _email,
      'phone': _phone,
      'address': _address,
      'age': _age,
    }).then((value) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Success'),
              content: const Text('Student added successfully!'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          }
      );
    }).catchError((error) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: Text('An error occurred: $error'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          }
      );
    });
  }
}
