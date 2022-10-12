import 'package:flutter/material.dart';
import 'package:flutter_optipets/app/app.locator.dart';
import 'package:flutter_optipets/app/app.router.dart';
import 'package:flutter_optipets/views/application/application_view_model.dart';

class LoginViewModel extends ChangeNotifier {
  final ApplicationViewModel applicationViewModel =
      locator<ApplicationViewModel>();
  TextEditingController usernameFieldController = TextEditingController();
  TextEditingController passwordFieldController = TextEditingController();

  void signInAnon() async {
    try {
      dynamic result = await applicationViewModel.auth.signInAnon();
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

  void signIn(String email, String password) async {
    print(email);
    print(password);
    try {
      final user = await applicationViewModel.auth
          .signInWithCredentials(email, password);
      if (user != null) {
        applicationViewModel.userObject = user;
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
    notifyListeners();
  }
}
