import 'dart:convert';

import 'package:bankapp/sharedPreferences/user_preferences.dart';
import 'package:http/http.dart' as http;

class UserProvider {
  final _apiKey = 'AIzaSyBuGlcehF62wkLVodB_5dyHp5OGjegKlIo';
  final _prefs = UserPreferences();

  Future<Map<String, dynamic>> login(String email, String password) async {
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final resp = await http.post(
        Uri.parse(
            'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_apiKey'),
        body: json.encode(authData));
    Map<String, dynamic> decoedResp = json.decode(resp.body);

    if (decoedResp.containsKey('idToken')) {
      _prefs.token = decoedResp['idToken'];
      return {'ok': true, 'token': decoedResp['idToken']};
    } else {
      // print(decoedResp);
      return {'ok': false, 'mensaje': decoedResp['error']['message']};
    }
  }
}
