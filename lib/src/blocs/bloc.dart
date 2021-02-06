import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'validators.dart';

class Bloc extends Object with Validators{
  final _email = StreamController<String>.broadcast();
  final _password = StreamController<String>.broadcast();

  // add data to stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  // Rx dart
  Stream<bool> get submitValid => CombineLatestStream.combine2(email, password, (e, p) => true);

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