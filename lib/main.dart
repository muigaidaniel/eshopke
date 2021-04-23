import 'package:eshopke/screens/cart.dart';
import 'package:eshopke/screens/home.dart';
import 'package:eshopke/screens/itemdetails.dart';
import 'package:eshopke/screens/login.dart';
import 'package:eshopke/screens/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
      routes: {
        'homepage': (context)=> HomeScreen(),
        'register':(context)=> Register(),
        'login' : (context)=> Login(),
        '/itemdetails':(context)=> Itemdetails(item: ModalRoute.of(context).settings.arguments),
        '/cart':(context)=> Cart()
      },
      title: 'E-Shop KE',
      theme: ThemeData(
        primaryColor: Colors.purple,
        accentColor: Colors.blueAccent,
        primarySwatch: Colors.cyan,
      ),
    );
  }
}