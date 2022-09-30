import 'package:flutter/material.dart';
import 'package:flutter_optipets/app/app.locator.dart';
import 'package:flutter_optipets/app/app.router.dart';
import 'package:flutter_optipets/views/application/application_view_model.dart';

class LoginViewModel extends ChangeNotifier {
  final ApplicationViewModel applicationViewModel =
      locator<ApplicationViewModel>();
  final TextEditingController usernameFieldController = TextEditingController();
  final TextEditingController passwordFieldController = TextEditingController();

  void login() async {
    await applicationViewModel.navigationService
        .pushReplacementNamed(Routes.petScreen);
    notifyListeners();
  }
}
