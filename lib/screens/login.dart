import 'package:flutter/material.dart';
import 'package:eshopke/components/input_field.dart';

class Login extends StatefulWidget {
  final String fieldName;
  Login({this.fieldName});
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            height: 500,
            child: Column(
              children: [
                Padding(padding: const EdgeInsets.all(8.0), child: Text('Login', style: TextStyle(fontSize: 50,color: Theme.of(context).primaryColor),),),
                InputField(fieldName: 'Email'),
                InputField(fieldName: 'Password',),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      width: MediaQuery.of(context).size.width,
                      height: 80,
                      child: RaisedButton(
                        color: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                        ),
                        child: Text('Login',style: TextStyle(fontSize: 20,color: Colors.white),),
                        onPressed: (){
                        Navigator.pushNamed(context, 'homepage');
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            duration: Duration(seconds: 2),
                            content: Text('Login successful!')));},),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.2),
                      child: Row(
                        children: [
                          Text("Don't have an account?"),
                          FlatButton(child: Text('Sign Up',style: TextStyle(color: Theme.of(context).primaryColor),),onPressed: (){
                            Navigator.pushNamed(context, 'register');
                            },),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
