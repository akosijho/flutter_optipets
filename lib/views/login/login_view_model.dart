import 'package:flutter/material.dart';
import 'package:flutter_optipets/app/app.locator.dart';
import 'package:flutter_optipets/app/app.router.dart';
import 'package:flutter_optipets/core/services/firebase_service/firebase_auth.dart';
import 'package:flutter_optipets/views/application/application_view_model.dart';

class LoginViewModel extends ChangeNotifier {
  final ApplicationViewModel applicationViewModel =
      locator<ApplicationViewModel>();
  final FirebaseAuthentication firebaseAuthentication =
      locator<FirebaseAuthentication>();
  final TextEditingController usernameFieldController = TextEditingController();
  final TextEditingController passwordFieldController = TextEditingController();

  void signInAnon() async {
    try {
      dynamic result = await firebaseAuthentication.signInAnon();
      if (result != null) {
        print("Result: $result");
        await applicationViewModel.navigationService
            .pushReplacementNamed(Routes.petScreen);
      }
    } catch (e) {
      rethrow;
    }
    notifyListeners();
  }
}
