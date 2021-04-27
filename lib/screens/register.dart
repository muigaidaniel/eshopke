import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference users= FirebaseFirestore.instance.collection('users');
  final firestoreInstance = FirebaseFirestore.instance;


  String username="";
  String email="";
  String phoneNumber="";
  String password="";

  Future RegWithEmail() async{
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email,password: password,);
      firestoreInstance.collection("users").add(
          {
            "username" : username,
            "email" : email,
            "phoneNumber" : phoneNumber,
            "password" : password,
          });
  }
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
                  Form(
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*0.9, margin: EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            onChanged: (val){setState(()=>username=val);},
                            style: TextStyle(fontSize: 20,),
                            decoration: InputDecoration(hintStyle: TextStyle( fontSize: 20), hintText: 'Username', enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2,),), border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 3,),), prefixIcon: Padding(child: Icon(Icons.person,color: Theme.of(context).primaryColor), padding: EdgeInsets.only(left: 30, right: 10),)),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*0.9, margin: EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            onChanged: (val){setState(()=>email=val);},
                            style: TextStyle(fontSize: 20,),
                            decoration: InputDecoration(hintStyle: TextStyle( fontSize: 20), hintText: 'Email', enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2,),), border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 3,),), prefixIcon: Padding(child: Icon(Icons.email,color: Theme.of(context).primaryColor), padding: EdgeInsets.only(left: 30, right: 10),)),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*0.9, margin: EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            onChanged: (val){setState(()=>phoneNumber=val);},
                            style: TextStyle(fontSize: 20,),
                            decoration: InputDecoration(hintStyle: TextStyle( fontSize: 20), hintText: 'Phone Number', enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2,),), border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 3,),), prefixIcon: Padding(child: Icon(Icons.phone,color: Theme.of(context).primaryColor), padding: EdgeInsets.only(left: 30, right: 10),)),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*0.9, margin: EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            obscureText: true,
                            onChanged: (val){setState(()=>password=val);},
                            style: TextStyle(fontSize: 20,),
                            decoration: InputDecoration(hintStyle: TextStyle( fontSize: 20), hintText: 'Password', enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2,),), border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 3,),), prefixIcon: Padding(child: Icon(Icons.lock,color: Theme.of(context).primaryColor), padding: EdgeInsets.only(left: 30, right: 10),)),
                          ),
                        ),
                      ],
                    ),
                  )
                  ,
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
                          RegWithEmail();
                          Navigator.popAndPushNamed(context, 'homepage');
                          Fluttertoast.showToast(msg:'Registered successfully');},),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.2),
                        child: Row(
                          children: [
                            Text('Have an account?'),
                            FlatButton(child: Text('Log in',style: TextStyle(color: Theme.of(context).primaryColor),),onPressed: (){
                              Navigator.popAndPushNamed(context, 'login');},),
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
