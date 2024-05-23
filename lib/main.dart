import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:grade_book/screens/LoginScreen.dart';
import 'package:grade_book/screens/MainScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {
  bool? isLoggedIn;
  @override
  void initState() {
    super.initState();
    _checkLoginStatus().then((value) {
      setState(() {
        isLoggedIn = value;
      });
    });
  }

  Future<bool> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;

  }


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: isLoggedIn == null ? const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ) : isLoggedIn! ? const MainScreen() : const LoginScreen()
    );
  }
}


