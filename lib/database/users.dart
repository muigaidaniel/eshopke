import 'package:cloud_firestore/cloud_firestore.dart';

class UserServices{
  final _firestoreInstance = FirebaseFirestore.instance;
  String collection= "users";

  void createUser(Map data){
    _firestoreInstance.collection(collection).doc(data["userId"]).set(data);
  }
}