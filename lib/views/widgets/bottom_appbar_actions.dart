import 'package:flutter/material.dart';
import 'package:flutter_optipets/app/app.locator.dart';
import 'package:flutter_optipets/views/application/application_view_model.dart';
import 'package:get/get.dart';

class MyBottomAppBarActions extends ChangeNotifier{

  final ApplicationViewModel applicationViewModel = locator<ApplicationViewModel>();
  
  void routeTo(dynamic route) {
    Get.off(route, transition: Transition.noTransition);
    notifyListeners();
  }
}