import 'package:flutter/material.dart';

import 'screens/login_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login with Bloc',
      home: Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}
