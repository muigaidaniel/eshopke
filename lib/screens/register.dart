import 'package:eshopke/components/input_field.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final String fieldName;
  Register({this.fieldName});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            height: 500,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Sign Up', style: TextStyle(fontSize: 50,color: Colors.lightBlue),),
                ),
                InputField(fieldName: 'Name'),
                InputField(fieldName: 'Phone number'),
                InputField(fieldName: 'Email'),
                InputField(fieldName: 'Password'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RaisedButton(child: Text('Sign up'),onPressed: (){
                      Navigator.pushNamed(context, 'homepage');
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          duration: Duration(seconds: 2),
                          content: Text('Registration successful!')));},),
                    RaisedButton(child: Text('Log in'),onPressed: (){
                      Navigator.pushNamed(context, 'login');},),
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
