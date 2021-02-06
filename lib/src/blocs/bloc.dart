import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'validators.dart';

class Bloc extends Object with Validators{
  // Change streamController to Behaiour Subject to get additional benifits. (see submit method)
//  final _email = StreamController<String>.broadcast();
//  final _password = StreamController<String>.broadcast();

  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  // add data to stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  // Rx dart
  Stream<bool> get submitValid => CombineLatestStream.combine2(email, password, (e, p) => true);

  // change data ( producer )
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  submit(){
    final validEmail = _email.value;
    final validPassword = _password.value;

    print('Email is: $validEmail');
    print('Password is: $validPassword');
  }

  dispose(){
    _email.close();
    _password.close();
  }
}
// Single Scoped Instance
//final bloc = Bloc();