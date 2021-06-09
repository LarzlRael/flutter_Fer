import 'dart:async';

import 'validators.dart';

class Bloc with Validators {
  final _nameController = StreamController<String>.broadcast();
  final _tooglePassword = StreamController<bool>.broadcast();

  Stream<String> get nameStream =>
      _nameController.stream.transform(validateName);
  Stream<bool> get tooglePasswordPassword => _tooglePassword.stream;

  Function(String) get changeName => _nameController.sink.add;
  Function(bool) get changeTooglePassword => _tooglePassword.sink.add;

  String get name => _nameController.toString();
  bool get tooglePassword => _tooglePassword as bool;
  /* bool get tooglePassword => _tooglePassword; */
  void dispose() {
    _nameController.close();
    _tooglePassword.close();
  }
}
