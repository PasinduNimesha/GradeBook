import 'package:flutter/material.dart';

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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const InputField(label: 'Username'),
            const InputField(label: 'Password'),
            MediumButton(
                text: "Sign In",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MainScreen())
                  );
                }),
          ],
        ),
      ),
    );
  }

}
