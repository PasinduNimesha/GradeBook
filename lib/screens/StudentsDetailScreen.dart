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
      body: Center(
        child: DataTable(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
          ),
          columns: const [
            DataColumn(label: Text('Index')),
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Age')),
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text('1')),
              DataCell(Text('John Doe')),
              DataCell(Text('20')),
            ]),
            DataRow(cells: [
              DataCell(Text('2')),
              DataCell(Text('Jane Doe')),
              DataCell(Text('22')),
            ]),
            DataRow(cells: [
              DataCell(Text('3')),
              DataCell(Text('John Smith')),
              DataCell(Text('25')),
            ]),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
