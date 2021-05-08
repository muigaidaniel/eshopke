import 'package:eshopke/screens/cart.dart';
import 'package:eshopke/screens/home.dart';
import 'package:eshopke/screens/itemdetails.dart';
import 'package:eshopke/screens/login.dart';
import 'package:eshopke/screens/register.dart';
import 'package:eshopke/screens/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eshopke/business_logic/user_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(create: (_)=>UserProvider.initialize(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: ScreensController(),
          routes: {
            'homepage': (context)=> HomeScreen(),
            'register':(context)=> Register(),
            'login' : (context)=> Login(),
            '/itemdetails':(context)=> Itemdetails(item: ModalRoute.of(context).settings.arguments),
            '/cart':(context)=> Cart(),
          },
          title: 'E-Shop KE',
          theme: ThemeData(
            primaryColor: Colors.purple,
            accentColor: Colors.blueAccent,
            primarySwatch: Colors.cyan,
          )
          )));
}

class ScreensController extends StatelessWidget {
  const ScreensController({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user= Provider.of<UserProvider>(context);
    switch(user.status){
      case Status.Uninitialized: return Login();
      case Status.Unauthenticated:
      case Status.Authenticating: return Login();
      case Status.Authenticated: return HomeScreen();
      default: return Login();
    }
  }
}