import 'package:flutter/material.dart';
import 'package:flutter_optipets/app/app.locator.dart';
import 'package:flutter_optipets/views/application/application_view_model.dart';

class MyBottomAppBarActions extends ChangeNotifier{

  final ApplicationViewModel applicationViewModel = locator<ApplicationViewModel>();
  
  void routeTo(String route) async {
    await applicationViewModel.navigationService.pushReplacementNamed(route);
    notifyListeners();
  }
}