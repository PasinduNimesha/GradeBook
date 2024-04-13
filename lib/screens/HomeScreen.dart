import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grade_book/components/LowerHome.dart';
import 'package:grade_book/components/UpperHome.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: const Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              UpperHome(),
              SizedBox(height: 20,),
              LowerHome(),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
