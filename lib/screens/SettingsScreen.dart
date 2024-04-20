import 'package:flutter/material.dart';

import '../components/SettingsCard.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings Screen'),
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
          ],
        ),
      ),
    );
  }
}
