import 'package:eshopke/screens/login.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      title: 'E-Shop KE',
      theme: ThemeData(
       accentColor: Colors.blueAccent,
        primarySwatch: Colors.cyan,
      ),
    );
  }
}
