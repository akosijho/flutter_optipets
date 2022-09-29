import 'package:flutter/material.dart';
import 'package:flutter_optipets/app/app.locator.dart';
import 'package:flutter_optipets/app/app.router.dart';
import 'package:flutter_optipets/core/services/navigation/navigation_sevice.dart';

class SplashScreenViewModel extends ChangeNotifier {
  final NavigationService navigationService = locator<NavigationService>();

  void init() async {
    await Future.delayed(const Duration(seconds: 6));
    navigationService.pushReplacementNamed(Routes.login);
    notifyListeners();
  }
}
