import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final String baseUrl = 'https://ibex-stunning-oarfish.ngrok-free.app/api';

  Future<String?> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/login');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      final String token = responseBody['token'];

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
      return null;
    } else {
      final Map<String, dynamic> responseBody = jsonDecode(response.body);
      return responseBody['message'];
    }
  }

  Future<Map<String, List<String>>> register(
      String name, String email, String password) async {
    final url = Uri.parse('$baseUrl/register');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 201) {
      return {};
    } else if (response.statusCode == 400) {
      final responseBody = jsonDecode(response.body);
      final Map<String, dynamic> errors = responseBody['errors'];
      return errors.map((key, value) {
        return MapEntry(key, List<String>.from(value));
      });
    } else {
      return {
        'general': ['An error occurred. Please try again.']
      };
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<bool> isLoggedIn() async {
    final token = await getToken();
    return token != null;
  }
}
