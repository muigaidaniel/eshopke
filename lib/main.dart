import 'package:eshopke/screens/cart.dart';
import 'package:eshopke/screens/home.dart';
import 'package:eshopke/screens/itemdetails.dart';
import 'package:eshopke/screens/login.dart';
import 'package:eshopke/states/currentstate.dart';
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
    return ChangeNotifierProvider(
      create: (context)=> CurrentState(),
      child: MaterialApp(
        home: HomeScreen(),
        routes: {
          '/itemdetails':(context)=> Itemdetails(item: ModalRoute.of(context).settings.arguments),
          '/cart':(context)=> Cart()
        },
        title: 'E-Shop KE',
        theme: ThemeData(
          accentColor: Colors.blueAccent,
          primarySwatch: Colors.cyan,
        ),
      ),
    );
  }
}


