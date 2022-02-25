import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:settings_app/providers/theme_provider.dart';
import 'package:settings_app/shared/user_preferences.dart';
import 'package:settings_app/widgets/custom_drawer.dart';

class SettingsScreen extends StatefulWidget {
  static const String routeName = 'settings';
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Settings', style: Theme.of(context).textTheme.headline4),
              const SizedBox(height: 8),
              const Text('This is the settings screen'),
              const Divider(),
              SwitchListTile.adaptive(
                  value: UserPreferences.isDarkMode,
                  title: const Text('Theme Dark'),
                  onChanged: (value) {
                    setState(() {
                      UserPreferences.isDarkMode = value;
                      final themeProvider =
                          Provider.of<ThemeProvider>(context, listen: false);
                      themeProvider.changeTheme(value);
                    });
                  }),
              const Divider(),
              RadioListTile(
                  title: const Text('Male'),
                  value: 1,
                  groupValue: UserPreferences.gender,
                  onChanged: (value) {
                    setState(() {
                      UserPreferences.gender = 1;
                    });
                  }),
              const Divider(),
              RadioListTile(
                  title: const Text('Female'),
                  value: 2,
                  groupValue: UserPreferences.gender,
                  onChanged: (value) {
                    setState(() {
                      UserPreferences.gender = 2;
                    });
                  }),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  initialValue: UserPreferences.userName,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    hintText: 'Name of the user',
                    helperText: 'Name of the user',
                  ),
                  onChanged: (value) {
                    setState(() {
                      UserPreferences.userName = value;
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
