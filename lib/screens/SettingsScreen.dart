import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/SettingsCard.dart';
import 'LoginScreen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            SettingsCard(
              title: 'Change user info',
              icon: Icons.person_outline_sharp,
              onTap: () {},
            ),
            SettingsCard(
              title: 'Notifications',
              icon: Icons.notifications,
              onTap: () {},
            ),
            SettingsCard(
              title: 'Dark Mode',
              icon: Icons.dark_mode,
              onTap: () {},
            ),
            SettingsCard(
              title: 'Language',
              icon: Icons.language,
              onTap: () {},
            ),
            SettingsCard(
              title: 'About',
              icon: Icons.info,
              onTap: () {},
            ),
            SizedBox(height: 40),
            ElevatedButton(onPressed: () {
              showDialog(context: context, builder: (context) {
                return AlertDialog(
                  title: const Text('Log Out'),
                  content: const Text('Are you sure you want to log out?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () async {
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        prefs.remove('username');
                        Get.offAll(() => const LoginScreen());
                      },
                      child: const Text('Log Out'),
                    ),
                  ],
                );
              });
            }, child: Text('Log Out'))
          ],
        ),
      ),
    );
  }
  void logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLoggedIn", false);
    Get.to(const LoginScreen());
  }
}


