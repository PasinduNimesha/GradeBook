import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StudentsDetailScreen extends StatelessWidget {
  const StudentsDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Students Detail Screen'),
      ),
      body: DataTable(
        columns: const [
          DataColumn(label: Text('Name')),
          DataColumn(label: Text('Age')),
          DataColumn(label: Text('Grade')),
        ],
        rows: [
          DataRow(cells: [
            DataCell(Text('John')),
            DataCell(Text('25')),
            DataCell(Text('A')),
          ]),
          DataRow(cells: [
            DataCell(Text('Alice')),
            DataCell(Text('30')),
            DataCell(Text('B')),
          ]),
          // Add more rows as needed
        ],
      )
      ,
    );
  }
}
