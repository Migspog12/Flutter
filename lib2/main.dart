import 'package:flutter/material.dart';
import 'telas/login_telas.dart';

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "App de Login",
      home: LoginTela(),
    ); // MaterialApp
  }
}
