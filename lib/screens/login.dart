import 'package:eshopke/screens/home.dart';
import 'package:eshopke/states/currentstate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController =TextEditingController();
  TextEditingController _passwordController =TextEditingController();

  void _loginUser(String email, String password, BuildContext context) async{
    CurrentState _currentState= Provider.of<CurrentState>(context, listen: false);
    try{
      if(await _currentState.loginUser(email, password)){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen()));
      }else{
        Scaffold.of(context).showSnackBar(
            SnackBar(
                content: Text("Incorrect email or password"),
                duration: Duration(seconds: 2),
            ));
      }
    }catch(e){
      print(e);
    }
  } //login button

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Email'
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password'
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            RaisedButton(
              color: Theme.of(context).accentColor,
                child: Text('Sign in'),
                onPressed: (){
                _loginUser(_emailController.text,_passwordController.text,context);
            }),
            RaisedButton(
              color: Theme.of(context).accentColor,
                child: Text('Register'),
                onPressed: (){

            })
          ],)
        ],
      ),
    );
  }
}


