import 'dart:async';

import 'validators.dart';

class Bloc extends Object with Validators{
  final _email = StreamController<String>();
  final _password = StreamController<String>();

  // add data to stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);

  // change data ( producer )
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  dispose(){
    _email.close();
    _password.close();
  }
}
// Single Scoped Instance
//final bloc = Bloc();