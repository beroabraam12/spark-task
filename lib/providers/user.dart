import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;


class User with ChangeNotifier {
  String token, id, email, password;

  Future<bool> signup() async {
    String url =
        "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDqxYSa0_rDdIuQkJbeC_uYVmc7Cx3wUy8";
    final response = await http.post(url,
        body: json.encode({
          'email': email,
          'password': password,
          'returnSecureToken': true,
        }));
    if (response.statusCode != 200 || response.statusCode != 200) {
      return false;
    } else {
      return true;
    }
  }
  Future<bool> signin() async {
    String url =
        "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyDqxYSa0_rDdIuQkJbeC_uYVmc7Cx3wUy8";
    final response = await http.post(url,
        body: json.encode({
          'email': email,
          'password': password,
          'returnSecureToken': true,
        }));
    if (response.statusCode != 200 || response.statusCode != 200) {
      return false;
    } else {
      return true;
    }
  }
}
