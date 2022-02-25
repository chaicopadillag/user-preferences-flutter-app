import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static late SharedPreferences _prefs;

  static String _userName = "";
  static bool _isDarkMode = false;
  static int _gender = 1;

  static Future initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String get userName {
    return _prefs.getString('userName') ?? _userName;
  }

  static set userName(String userName) {
    _userName = userName;
    _prefs.setString('userName', userName);
  }

  static bool get isDarkMode {
    return _prefs.getBool('isDarkMode') ?? _isDarkMode;
  }

  static set isDarkMode(bool isDarkMode) {
    _isDarkMode = isDarkMode;
    _prefs.setBool('isDarkMode', isDarkMode);
  }

  static int get gender {
    return _prefs.getInt('gender') ?? _gender;
  }

  static set gender(int gender) {
    _gender = gender;
    _prefs.setInt('gender', gender);
  }
}
