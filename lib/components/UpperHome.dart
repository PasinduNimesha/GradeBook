import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpperHome extends StatefulWidget {
  const UpperHome({super.key});

  @override
  State<UpperHome> createState() => _UpperHomeState();
}

class _UpperHomeState extends State<UpperHome> {
  int _numberOfCourses = 0;
  int _numberOfStudents = 0;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: isLoading? const CupertinoActivityIndicator():GridView.count(
        crossAxisCount: 2,
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Number of Students"),
                Text(
                  '$_numberOfStudents',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ]
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Number of Courses"),
                Text(
                  '$_numberOfCourses',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ]
            ),
          ),
        ],
      )
    );
  }

  void initialize() async{
    await FirebaseFirestore.instance.collection('courses').get().then((value) {
      _numberOfCourses = value.docs.length;
    });
    await FirebaseFirestore.instance.collection('students').get().then((value) {
      _numberOfStudents = value.docs.length;
    });
    await Future.delayed(const Duration(milliseconds: 200));
    setState(() {
      isLoading = false;
    });

  }
}
