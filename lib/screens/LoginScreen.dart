import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../components/InputField.dart';
import '../components/MediumButton.dart';
import 'HomeScreen.dart';
import 'MainScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String txt_username = "";
  String txt_password = "";
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isLoading ?
        const CircularProgressIndicator() :
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InputField(
                label: 'Username',
                onPressed: (value) {
                  txt_username = value;
                }),
            const SizedBox(height: 20,),
            InputField(
              label: 'Password',
              onPressed: (value) {
                txt_password = value;
              },
              obscureText: true,
            ),
            const SizedBox(height: 20,),
            MediumButton(
                text: "Sign In",
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  if(txt_username.isNotEmpty && txt_password.isNotEmpty){
                    var auth = FirebaseAuth.instance;
                    auth
                        .signInWithEmailAndPassword(
                        email: txt_username, password: txt_password)
                        .then((value) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const MainScreen())
                      );
                      setState(() {
                        isLoading = false;
                      });

                    }).catchError((onError) {
                      Get.snackbar("Username or Password is incorrect", "Please try again");
                      setState(() {
                        isLoading = false;
                      });
                    });
                  } else {
                    Get.snackbar('Error', 'Please fill all fields');
                    setState(() {
                      isLoading = false;
                    });
                  }

                }),
          ],
        ),



      ),
    );
  }

}
