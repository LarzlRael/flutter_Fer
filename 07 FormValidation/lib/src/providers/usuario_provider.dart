import 'dart:convert';

import 'package:formvalidation/src/user_prreferences/user_preferences.dart';
import 'package:http/http.dart' as http;

class UsuarioProvider {
  final String _fireBaseToken = 'AIzaSyDzol3JZBoX-48qAybKelWckez4ngtBWTY';
  final _prefs = UserPreferences();
  Future<Map<String, dynamic>> newUsuario(String email, String password) async {
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final resp = await http.post(
      Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_fireBaseToken',
      ),
      body: json.encode(authData),
    );

    Map<String, dynamic> decodedResp = json.decode(resp.body);

    if (decodedResp.containsKey('idToken')) {
      _prefs.token = decodedResp['idToken'];

      return {'ok': true, 'token': decodedResp['idToken']};
    } else {
      return {'ok': true, 'mensaje': decodedResp['error']['message']};
    }
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final resp = await http.post(
      Uri.parse(
          'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_fireBaseToken'),
      body: json.encode(authData),
    );

    Map<String, dynamic> decodedResp = json.decode(resp.body);

    if (decodedResp.containsKey('idToken')) {
      _prefs.token = decodedResp['idToken'];
      print(decodedResp);
      return {'ok': true, 'token': decodedResp['idToken']};
    } else {
      return {'ok': false, 'mensaje': decodedResp['error']['message']};
    }
  }
}
