import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grade_book/components/LowerHome.dart';
import 'package:grade_book/components/UpperHome.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    initialize();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body:
      isLoading ?
      const Center(
        child: CircularProgressIndicator(),
      ) :
      const SingleChildScrollView(
        child: Center(
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

  void initialize() async {
    await Future.delayed(const Duration(milliseconds: 200));
    setState(() {
      isLoading = false;
    });
  }
}
