import 'package:eshopke/components/input_field.dart';
import 'package:flutter/cupertino.dart';
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
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height*0.8,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Sign Up', style: TextStyle(fontSize: 50,color: Theme.of(context).primaryColor),),
                  ),
                  InputField(fieldName: 'Name'),
                  InputField(fieldName: 'Phone number'),
                  InputField(fieldName: 'Email'),
                  InputField(fieldName: 'Password'),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                          child: Text('Sign up',style: TextStyle(fontSize: 20,color: Colors.white),),onPressed: (){
                          Navigator.pushNamed(context, 'homepage');
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              duration: Duration(seconds: 2),
                              content: Text('Registration successful!')));},),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.2),
                        child: Row(
                          children: [
                            Text('Have an account?'),
                            FlatButton(child: Text('Log in',style: TextStyle(color: Theme.of(context).primaryColor),),onPressed: (){
                              Navigator.pushNamed(context, 'login');},),
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
      ),
    );
  }
}
