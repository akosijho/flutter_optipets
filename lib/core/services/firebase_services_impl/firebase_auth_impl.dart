import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_optipets/core/services/firebase_service/firebase_auth.dart';
import 'package:flutter_optipets/models/user_object.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: FirebaseAuthentication)
class FirebaseAuthenticatioImpl implements FirebaseAuthentication{
  
  //instantiate Firebase Auth package
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserObject? _userFromFirebase(dynamic user){
    return user != null ? UserObject(uid: user.uid) : null;
  }
  
  //signInAnon
  @override
  Future signInAnon() async {
    try {
      var result = await _auth.signInAnonymously();
      var user = result.user;
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}