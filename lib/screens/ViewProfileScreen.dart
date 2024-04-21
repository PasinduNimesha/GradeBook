import 'package:flutter/material.dart';

class ViewProfileScreen extends StatelessWidget {
  const ViewProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Profile Screen'),
      ),
      body: const Center(
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnwxypGUcF0-hZwuAgd4cucn2o8Zk6t1d9Jw5mik5S_Dpd3A9bw1Tl9eS-4G0fFmQojUQ&usqp=CAU'),
            ),
            SizedBox(height: 20),
            Text('John Doe'),
            SizedBox(height: 20),
            Text('')
          ],
        ),
      ),
    );
  }
}
