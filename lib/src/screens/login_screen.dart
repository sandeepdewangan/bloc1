import 'package:flutter/material.dart';

import '../blocs/bloc.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.fromLTRB(10,10,10,5),
        child: Column(
          children: [
            // Email Field Stream Builder
            StreamBuilder(
              stream: bloc.email,
              builder: (context, snapshot){
                return TextField(
//                  onChanged: (newValue){
//                    bloc.changeEmail(newValue);
//                  }, // alternate approach
                onChanged: bloc.changeEmail,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    hintText: 'abc@gmail.com',
                    errorText: snapshot.error,
                  ),
                );
              },
            ),

            // Password Field Stream Builder
            StreamBuilder(
              stream: bloc.password,
              builder: (context, snapshot){
                return TextField(
                  onChanged: bloc.changePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Enter password',
                    hintText: 'Password',
                    errorText: snapshot.error,
                  ),
                );
              },
            ),
            // Submit button
            RaisedButton(
                onPressed: (){},
              child: Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}
