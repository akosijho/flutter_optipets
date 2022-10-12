import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_optipets/core/services/firebase_service/auth.dart';
import 'package:flutter_optipets/models/user_object.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: Auth)
class AuthImpl implements Auth {
  //instantiate Firebase Auth package
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // simply return a user object from firebase user
  @override
  UserObject? userFromFirebase(dynamic user) {
    return UserObject(uid: user.uid);
  }

  //signInAnon
  @override
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user!;
      return userFromFirebase(user);
    } catch (e) {
      return null;
    }
  }

  @override
  //sign out
  Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      rethrow;
    }
  }
}
