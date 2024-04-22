import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grade_book/screens/AddMarksScreen.dart';

class CourseDetailScreen extends StatefulWidget {
  final String documentID;

  const CourseDetailScreen({super.key, required this.documentID});

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  int term = 1;
  int totalStudents = 0;
  double averageMarks = 0.0;
  bool isLoading = false;
  Map<String, dynamic> tableData = {};

  @override
  void initState() {
    super.initState();
    _calculateCourseDetails();
  }

  Future<void> _calculateCourseDetails() async {
    setState(() {
      isLoading = true;
    });
    try {
      final marksSnapshot = await FirebaseFirestore
          .instance
          .collection('marks')
          .where('courseID', isEqualTo: FirebaseFirestore.instance.doc('/courses/${widget.documentID}')).where('term', isEqualTo: term)
          .get();
      int totalMarks = 0;
      totalStudents = marksSnapshot.docs.length;
      tableData = {};

      for (final doc in marksSnapshot.docs) {
        final data = doc.data();
        final marks = data['marks'] as int;
        totalMarks += marks;
        final studentID = data['studentID'].toString().split('/').last.split(')')[0];
        final studentRef = data['studentID'] as DocumentReference<Map<String, dynamic>>;
        print(studentRef);
        await FirebaseFirestore.instance.collection('students').doc(studentID).get().then((value) {
          tableData[value['username']] = marks;
        });
      }

      print(tableData);

      averageMarks = totalMarks / totalStudents;

      // Update the course details in Firestore
      await FirebaseFirestore.instance.collection('courses').doc(widget.documentID).update({
        'total_students': totalStudents,
        'average_marks': averageMarks,
      });

      setState(() {
        isLoading = false;
      }); // Update UI with new values
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
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            DropdownButton<int>(
              value: term,
              items: const [
                DropdownMenuItem(child: Text('Term 1'), value: 1),
                DropdownMenuItem(child: Text('Term 2'), value: 2),
                DropdownMenuItem(child: Text('Term 3'), value: 3),
              ],
              onChanged: (value) {
                setState(() {
                  term = value!;
                });
                _calculateCourseDetails();
              },
            ),
            const SizedBox(height: 20),
            Text('Total Students: $totalStudents'),
            const SizedBox(height: 20),
            Text('Average Marks: $averageMarks'),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: DataTable(
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 1),
                      bottom: BorderSide(width: 1),
                    ),
                  ),
                  columnSpacing: 150,
                  border: TableBorder.all(),
                  columns: const [
                    DataColumn(label: Text('Username')),
                    DataColumn(label: Text('Marks')),
                  ],
                  rows: tableData.entries.map((entry) {
                    final name = entry.key;
                    final marks = entry.value;
                    return DataRow(cells: [
                      DataCell(Text(name)),
                      DataCell(Text(marks.toString()), showEditIcon: false),
                    ]);
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddMarksScreen(courseID: widget.documentID,)),
          );

        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
