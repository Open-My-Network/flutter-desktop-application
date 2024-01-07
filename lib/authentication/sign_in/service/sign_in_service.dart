import 'dart:convert';
import 'package:http/http.dart' as http;

class SignInService {
  Future<bool> loginUser(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse("https://openmynetwork.com/wp-json/api/v1/login"),
        body: jsonEncode({
          "username": username,
          "password": password,
        }),
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      throw false;
    }
  }
}
