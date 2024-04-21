import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:grade_book/components/InputField.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class AddStudentScreen extends StatefulWidget {
  final bool toUpdate;
  final String documentID;
  final Map<String, dynamic> studentData;
  const AddStudentScreen({super.key, required this.toUpdate, this.documentID = '', this.studentData = const {}});


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
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    if(widget.toUpdate){
      fetchStudentDetails();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Student Screen'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: _isLoading? const CircularProgressIndicator()
          :Column(
            children: [
              InputField(label: "First Name", onPressed: (String value) {
                setState(() {
                  _firstName = value;
                });
              },
                defaultValue: widget.toUpdate? widget.studentData['first_name']: '',
              ),
              InputField(label: "Last Name", onPressed: (String value) {
                setState(() {
                  _lastName = value;
                });
              },
                defaultValue: widget.toUpdate? widget.studentData['last_name']: '',
              ),
              InputField(label: "Email", onPressed: (String value) {
                setState(() {
                  _email = value;
                });
              },
                defaultValue: widget.toUpdate? widget.studentData['email']: '',
              ),
              InputField(label: "Phone", onPressed: (String value) {
                setState(() {
                  _phone = value;
                });
              },
                defaultValue: widget.toUpdate? widget.studentData['phone']: '',
              ),
              InputField(label: "Address", onPressed: (String value) {
                setState(() {
                  _address = value;
                });
              },
                defaultValue: widget.toUpdate? widget.studentData['address']: '',
              ),
              InputField(label: "Age", onPressed: (String value) {
                setState(() {
                  _age = int.parse(value);
                });
              },
                defaultValue: widget.toUpdate? widget.studentData['age'].toString(): '',
              ),
              ElevatedButton(onPressed: () {
                if(!widget.toUpdate){
                  handleAddStudent();
                }else{
                  handleUpdateStudent();
                }
                }, child: !widget.toUpdate? Text('Add Student'): Text('Update Student')
              ),
              ElevatedButton(onPressed: (){
                print(_firstName);
              }, child: Text('Cancel'))
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

  void fetchStudentDetails() async {
    FirebaseFirestore.instance.collection('students').doc(widget.documentID).get().then((value) {
      final data = value.data();
      Future.delayed(const Duration(seconds: 3));
      setState(() {
        _firstName = data?['first_name'] ?? "";
        _lastName = data?['last_name'] ?? '';
        _email = data?['email'] ?? '';
        _phone = data?['phone'] ?? '';
        _address = data?['address'] ?? '';
        _age = data?['age'] ?? 0;
      });
    });
    setState(() {
      _isLoading = false;
    });
  }

  void handleUpdateStudent() {
    FirebaseFirestore.instance.collection('students').doc(widget.documentID).update({
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
              content: const Text('Student updated successfully!'),
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
