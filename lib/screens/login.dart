import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshopke/screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  bool loading = false;
  bool isLoggedin= false;

  Future signInWithGoogle () async{
    setState(() {
      isLoggedin=true;
    });
     final user= await googleSignIn.signIn();
     if (user== null){
       loading=false;
       return;
     }else{
       GoogleSignInAccount googleUser= await googleSignIn.signIn();
       GoogleSignInAuthentication googleSignInAuthentication = await googleUser.authentication;
       AuthCredential credential =GoogleAuthProvider.credential(
           idToken: googleSignInAuthentication.idToken,
           accessToken: googleSignInAuthentication.accessToken);
       await FirebaseAuth.instance.signInWithCredential(credential);
       loading=false;
       Fluttertoast.showToast(msg: "Log in was successful");
     }
     if(isLoggedin){
       Navigator.popAndPushNamed(context, 'homepage');
     }

     if(loading){
       return Center(
         child: CircularProgressIndicator(
           valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
         ),
       );
     }

  }
  String email="";
  String password="";
  Future signInWithEmail () async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      setState(() {
        isLoggedin=true;
      });
      if(isLoggedin){
        Navigator.popAndPushNamed(context, 'homepage');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(msg:'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(msg:'Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              height: 500,
              child: Column(
                children: [
                  Padding(padding: const EdgeInsets.all(8.0), child: Text('Login', style: TextStyle(fontSize: 50,color: Theme.of(context).primaryColor),),),
                  Form(
                    child: Column(
                      children: [
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
                            onChanged: (val){setState(()=>password=val);},
                            style: TextStyle(fontSize: 20,),
                            decoration: InputDecoration(hintStyle: TextStyle( fontSize: 20), hintText: 'Password', enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2,),), border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 3,),), prefixIcon: Padding(child: Icon(Icons.lock,color: Theme.of(context).primaryColor), padding: EdgeInsets.only(left: 30, right: 10),)),
                          ),
                        ),
                      ],
                    ),
                  ),
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
                            signInWithEmail();
                          },),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        width: MediaQuery.of(context).size.width,
                        height: 80,
                        child: OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.red,width: 3),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),),
                          icon: Icon(FontAwesomeIcons.google,color: Colors.red,),
                          //ImageIcon(AssetImage("images/icon/google.png"), size: 1,),
                          label: Text('Log in with Google',style: TextStyle(fontSize: 20,color: Colors.red)),
                          onPressed: (){
                            signInWithGoogle();
                          },
                          )
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
                      /*Container(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
                        ),
                      ),*/
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
