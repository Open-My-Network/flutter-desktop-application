import 'package:shared_preferences/shared_preferences.dart';

Future<void> currentUserStatus() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool("currentUserState", true);
}

Future<bool> getcurrentUserStatus() async {
  final prefs = await SharedPreferences.getInstance();
  final output = prefs.getBool("currentUserState");

  return output ?? false;
}

Future<void> logoutUserStatus() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.clear();
}
