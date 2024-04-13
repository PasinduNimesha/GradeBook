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
      body: const Center(
        child: Text('Students Detail Screen'),
      ),
    );
  }
}
