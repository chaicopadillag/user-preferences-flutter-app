import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:settings_app/providers/theme_provider.dart';
import 'package:settings_app/screens/screens.dart';
import 'package:settings_app/shared/user_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences.initPrefs();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
        create: (_) => ThemeProvider(isDarkMode: UserPreferences.isDarkMode)),
  ], child: const SettingsApp()));
}

class SettingsApp extends StatelessWidget {
  const SettingsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Settings App',
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        SettingsScreen.routeName: (context) => const SettingsScreen(),
      },
      theme: Provider.of<ThemeProvider>(context).currentThme,
    );
  }
}
