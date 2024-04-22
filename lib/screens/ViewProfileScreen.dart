import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ViewProfileScreen extends StatelessWidget {
  final String documentID;
  const ViewProfileScreen({super.key, required this.documentID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Profile Screen'),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance.collection('students').doc(documentID).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text('No data found'));
          } else {
            var userData = snapshot.data!.data() as Map<String, dynamic>?;
            return SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(18.0),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnwxypGUcF0-hZwuAgd4cucn2o8Zk6t1d9Jw5mik5S_Dpd3A9bw1Tl9eS-4G0fFmQojUQ&usqp=CAU',
                            ),
                          ),
                        ),
                        Positioned(
                            top: 70,
                            left: 80,
                            child: IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                print('Edit profile');
                              },
                            ),
                        ),
                      ]
                    ),
                    const SizedBox(height: 20),
                    Text('First Name: ${userData!['first_name']}'),
                    const SizedBox(height: 10),
                    Text('Last Name: ${userData['last_name']}'),
                    const SizedBox(height: 10),
                    Text('Email: ${userData['email']}'),
                    const SizedBox(height: 10),
                    Text('Phone: ${userData['phone']}'),
                    const SizedBox(height: 10),
                    Text('Address: ${userData['address']}'),
                    const SizedBox(height: 10),
                    Text('Age: ${userData['age']}'),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
