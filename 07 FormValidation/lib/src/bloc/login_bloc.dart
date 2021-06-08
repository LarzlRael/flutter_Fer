// validation from with block

import 'dart:async';

import 'package:formvalidation/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators {
  // create 2 stream controllers

  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  // get the stream data
  Stream<String> get emailStream =>
      _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(validarPassword);

  Stream<bool> get formValidStream =>
      CombineLatestStream.combine2(emailStream, passwordStream, (e, p) => true);

  // Insert value to stream

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

// get the last value
  String get email => _emailController.value;
  String get password => _passwordController.value;
  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
