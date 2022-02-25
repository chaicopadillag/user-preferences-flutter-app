import 'package:flutter/material.dart';
import 'package:settings_app/screens/screens.dart';
import 'package:settings_app/shared/user_preferences.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(UserPreferences.userName,
                style: const TextStyle(color: Colors.white)),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg-material.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text(
              'Home',
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, HomeScreen.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text(
              'People',
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text(
              'Settings',
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, SettingsScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
