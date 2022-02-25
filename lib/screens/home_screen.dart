import 'package:flutter/material.dart';
import 'package:settings_app/shared/user_preferences.dart';
import 'package:settings_app/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: const CustomDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Theme: ${UserPreferences.isDarkMode ? 'Dark' : 'Light'}'),
          const Divider(),
          Text('Gender: ${UserPreferences.gender == 1 ? 'Male' : 'Femile'}'),
          const Divider(),
          Text('User: ${UserPreferences.userName}'),
          const Divider()
        ],
      ),
    );
  }
}
