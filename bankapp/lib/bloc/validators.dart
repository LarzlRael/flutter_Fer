import 'dart:async';

class Validators {
  final validateName =
      StreamTransformer<String, String>.fromHandlers(handleData: (name, sink) {
    if (name.length >= 6) {
      sink.add(name);
    } else {
      sink.addError('Más de 6 caracteres por favor');
    }
  });
}
