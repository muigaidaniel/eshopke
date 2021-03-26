import 'package:eshopke/components/input_field.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
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
                  child: Text('Register', style: TextStyle(fontSize: 50,color: Colors.lightBlue),),
                ),
                InputField(),
                InputField(),
                InputField(),
                InputField(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RaisedButton(child: Text('Sign up'),onPressed: (){
                      Navigator.pushNamed(context, 'homepage');},),
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
