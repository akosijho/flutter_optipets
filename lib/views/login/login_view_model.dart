import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_optipets/app/app.locator.dart';
import 'package:flutter_optipets/app/app.router.dart';
import 'package:flutter_optipets/models/user_object.dart';
import 'package:flutter_optipets/views/application/application_view_model.dart';
import 'package:flutter_optipets/views/widgets/show_snackbar.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel {
  final ApplicationViewModel applicationViewModel =
      locator<ApplicationViewModel>();
  TextEditingController usernameFieldController = TextEditingController();
  TextEditingController passwordFieldController = TextEditingController();

  // signin anonymously
  void signInAnon() async {
    try {
      dynamic result = await applicationViewModel.auth.signInAnon();
      if (result != null) {
        // print("Result: $result");
        await applicationViewModel.navigationService
            .pushReplacementNamed(Routes.petScreen);
      }
    } catch (e) {
      rethrow;
    }
    notifyListeners();
  }

  // sign in with credentials
  void signIn(String email, String password) async {
    setBusy(true);
    try {
      final user = await applicationViewModel.auth
          .signInWithCredentials(email, password);
      if (user != null) {
        // applicationViewModel.userObject = user;
        //get user details from firestore
        info();
        await applicationViewModel.navigationService
            .pushReplacementNamed(Routes.petScreen);
      } else {
        return null;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnackbar(title: 'Oops', message: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        showSnackbar(
            title: 'Oops', message: 'Wrong password provided for that user.');
      } else {
        showSnackbar(
            title: 'Oops', message: 'Something went wrong. Please try again');
      }
    }
    setBusy(false);
    notifyListeners();
  }

  void info() {
    final docRef = applicationViewModel.firebaseFirestore
        .collection("users")
        .doc(applicationViewModel.userObject!.uid);
    docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        // ...
        applicationViewModel.userObject = UserObject(
          uid: applicationViewModel.userObject!.uid,
          name: data['name'],
          address: data['address'],
          contacts: data['contacts']);
      },
    );
  }
}
