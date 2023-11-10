import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefManager {
  static late SharedPreferences prefs;

  static set isFirstLaunch(bool isFirstLaunch) =>
      prefs.setBool("isFirstLaunch", isFirstLaunch);
  static bool get isFirstLaunch => prefs.getBool("isFirstLaunch") ?? true;

  static set isLoggedIn(bool isLoggedIn) =>
      prefs.setBool("isLoggedIn", isLoggedIn);
  static bool get isLoggedIn => prefs.getBool("isLoggedIn") ?? false;

  static void clear() {
    SharedPrefManager.isFirstLaunch = false;
    SharedPrefManager.isLoggedIn = false;
  }

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }
}
