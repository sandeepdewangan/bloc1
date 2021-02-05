import 'dart:async';

import 'dart:math';

class Validators{
  // String, String -> input / output type.
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink){
      if(email.contains('@')){
        sink.add(email);
      }else{
        sink.addError('Enter a valid email');
      }
    }
  );
  
  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink){
      if(password.length > 3){
        sink.add(password);
      }else{
        sink.addError('Password must be greater than 3 characters.');
      }
    }
  );
}