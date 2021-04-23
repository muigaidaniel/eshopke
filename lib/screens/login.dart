import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshopke/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:eshopke/components/input_field.dart';

class Login extends StatefulWidget {

  final String fieldName;
  Login({this.fieldName});



  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final GoogleSignIn googleSignIn = new GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  SharedPreferences preferences;

  bool loading = false;
  bool isLoggediIn = false;


  @override
  void initState() {
    super.initState();
    isSignedIn();
  }

  void isSignedIn() async {
    setState(() {
      loading = true;
    });
    preferences = await SharedPreferences.getInstance();
    isLoggediIn= await googleSignIn.isSignedIn();
    if (isLoggediIn){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> new HomeScreen()));
    }
    setState(() {
      loading = false;
    });
  }

  Future handleSignIn () async{
    preferences= await SharedPreferences.getInstance();

    setState(() {
      loading=true;
    });

    GoogleSignInAccount googleUser= await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication = await googleUser.authentication;
    AuthCredential credential =GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    /*if(credential !=null){
      final QuerySnapshot result= await Firestore.instance.collection('users').where('id',isEqualTo: firebaseUser.uid).getDocuments();
      final List<DocumentSnapshot> docs = result.documents;
      if (docs.length==0){
        //insert user to collection
        Firestore.instance
            .collection('users')
            .document(firebaseUser.uid).setData({
          "id": firebaseUser.uid,
          "username": firebaseUser.displayName,
          "profilePicture": firebaseUser.photoUrl
        });
      }
    }else{

    }*/
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
      ),
    );
  }

}
