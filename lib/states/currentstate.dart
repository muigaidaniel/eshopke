import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class CurrentState extends ChangeNotifier{
  String _uid;
  String _email;
  String get getUid =>_uid;
  String get getEmail => _email;

  FirebaseAuth _auth= FirebaseAuth.instance;

  Future<bool> signUpUser(String email, String password) async{
    bool returnValue= false;
    try{
      UserCredential _userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      if(_userCredential.user != null){
        returnValue= true;
      }
    }catch(e){
      print(e);
    }

    return returnValue;

  }

  Future<bool> loginUser(String email, String password) async{
    bool returnValue= false;
    try{
      UserCredential _userCredential =
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      if(_userCredential.user != null){
        _uid=_userCredential.user.uid;
        _email=_userCredential.user.email;
        returnValue= true;
      }
    }catch(e){
      print(e);
    }

    return returnValue;
  }

}