import 'package:flutter/material.dart';
import 'package:eshopke/components/input_field.dart';

class Login extends StatelessWidget {
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
                  child: Text('Login', style: TextStyle(fontSize: 50,color: Colors.lightBlue),),
                ),
                InputField(),
                InputField(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RaisedButton(child: Text('Login'),onPressed: (){
                      Navigator.pushNamed(context, 'homepage');},),
                    RaisedButton(child: Text('Register'),onPressed: (){
                      Navigator.pushNamed(context, 'register');},),
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
