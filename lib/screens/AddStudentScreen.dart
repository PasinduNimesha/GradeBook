import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grade_book/components/InputField.dart';

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
              ElevatedButton(onPressed: () {}, child: const Text('Add Student')),

            ],
          ),
        ),
      ),
    );
  }
}
