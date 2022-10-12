import 'dart:async';
import 'package:flutter_optipets/models/user_object.dart';

abstract class Auth {

   // simply return a user object from firebase user
  UserObject? userFromFirebase(dynamic user);
  
  //sign in anon
  Future signInAnon();

  //sign in with credentials
  Future signInWithCredentials(String email, String password);

  //sign out
  Future signOut();
}