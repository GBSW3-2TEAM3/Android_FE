import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:walking/presentation/screens/sign_in_screen.dart';
import '../../presentation/screens/main_screen.dart';

class AuthRepository {
  final url = 'http://172.31.240.1:8080/api';

  final Client client = Client();

  Future<void> signIn(
    String id,
    String password,
    String passwordCheck,
    BuildContext context,
  ) async {
    final body = {"username": id, "password": password};

    final response = await http.post(
      Uri.parse('${url}/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);

      String token = responseData['jwt'];
      String userName = responseData['username'];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('accessToken', token);
      await prefs.setString('userName', userName);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
      );
    }
  }

  Future<bool?> signUp(
    String name,
    String password,
    String passwordConfirm,
    BuildContext context,
  ) async {
    final body = {
      'username': name,
      'password': password,
      'passwordConfirm': passwordConfirm,
    };

    final response = await http.post(
      Uri.parse('${url}/auth/signup'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );

    if (response.statusCode == 201) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignInScreen()),
      );
    }
  }
}
