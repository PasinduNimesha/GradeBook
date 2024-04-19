import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grade_book/screens/AddStudentScreen.dart';

class StudentsDetailScreen extends StatefulWidget {
  const StudentsDetailScreen({super.key});

  @override
  State<StudentsDetailScreen> createState() => _StudentsDetailScreenState();
}

class _StudentsDetailScreenState extends State<StudentsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Students Detail Screen'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('students').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Error fetching data'));
          }
          if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No students found'));
          }
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: DataTable(
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1),
                    bottom: BorderSide(width: 1),
                  ),
                ),
                border: TableBorder.all(),
                columns: const [
                  DataColumn(label: Text('First Name'),),
                  DataColumn(label: Text('Last Name')),
                  DataColumn(label: Text('Age')),
                  DataColumn(label: Text('Edit')),
                ],
                rows: _buildRows(snapshot.data!.docs),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddStudentScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  List<DataRow> _buildRows(List<DocumentSnapshot> docs) {
    return docs.map((doc) {
      final student = doc.data() as Map<String, dynamic>;
      return DataRow(
        cells: [
          DataCell(Text(student['first_name'] ?? '')),
          DataCell(Text(student['last_name'] ?? '')),
          DataCell(Text(student['age']?.toString() ?? '')),
          DataCell(Icon(Icons.edit)),
        ],
      );
    }).toList();
  }


}
