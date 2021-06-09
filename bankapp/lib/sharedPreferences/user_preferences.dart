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

  double get saldo {
    return _prefs!.getDouble('saldo') ?? 0.00;
  }

  set saldo(double newSaldo) {
    _prefs!.setDouble('saldo', newSaldo);
  }
}
