import 'dart:convert';
import 'package:http/http.dart' as http;

class SignUpService {
  Future<bool> registerUser(
    String username,
    String email,
    String password,
  ) async {
    try {
      final response = await http.post(
        Uri.parse("https://openmynetwork.com/wp-json/api/v1/register"),
        body: jsonEncode({
          "username": username,
          "password": password,
          "email": email,
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
