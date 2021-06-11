import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final UserPreferences _instancia = new UserPreferences._internal();

  factory UserPreferences() {
    return _instancia;
  }
  UserPreferences._internal();

  SharedPreferences? _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  String get name {
    return _prefs!.getString('name') ?? 'Joe Doe';
  }

  set name(String name) {
    _prefs!.setString('name', name);
  }

  String get email {
    return _prefs!.getString('email') ?? '0';
  }

  set email(String email) {
    _prefs!.setString('email', email);
  }

  String get password {
    return _prefs!.getString('password') ?? '0';
  }

  set password(String password) {
    _prefs!.setString('password', password);
  }

  String get token {
    return _prefs!.getString('token') ?? '0';
  }

  set token(String token) {
    _prefs!.setString('token', token);
  }

  double get saldo {
    return _prefs!.getDouble('saldo') ?? 0.00;
  }

  set saldo(double newSaldo) {
    _prefs!.setDouble('saldo', newSaldo);
  }

  void clearUserPrerences() {
    this.email = '';
    this.password = '';
    this.token = '';
  }
}
