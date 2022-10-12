import 'package:flutter/cupertino.dart';
import 'package:flutter_optipets/app/app.locator.dart';
import 'package:flutter_optipets/app/app.router.dart';
import 'package:flutter_optipets/views/application/application_view_model.dart';

class CustomerProfileViewModel extends ChangeNotifier{

  final ApplicationViewModel applicationViewModel = locator<ApplicationViewModel>();

  void signOut() async{
    await applicationViewModel.auth.signOut();
    await applicationViewModel.navigationService.pushReplacementNamed(Routes.login);
    notifyListeners();
  }
}