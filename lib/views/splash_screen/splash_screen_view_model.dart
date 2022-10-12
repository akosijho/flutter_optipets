import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_optipets/app/app.locator.dart';
import 'package:flutter_optipets/app/app.router.dart';
import 'package:flutter_optipets/utils/constants.dart';
import 'package:flutter_optipets/utils/my_colors.dart';
import 'package:flutter_optipets/views/application/application_view_model.dart';
import 'package:flutter_optipets/views/widgets/my_circular_progress.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:stacked/stacked_annotations.dart';

@LazySingleton(asType: SplashScreenViewModel)
class SplashScreenViewModel extends ChangeNotifier {
  final ApplicationViewModel applicationViewModel =
      locator<ApplicationViewModel>();
  late StreamSubscription connectivitySubscription;
  late StreamSubscription<User?> authChange;
  bool isConnected = false;
  bool isAlertSet = false;

  void init() {
    //reads if a user is still logged in
    authChange = FirebaseAuth.instance.userChanges().listen((User? user) async {
      if (user == null) {
        await Future.delayed(const Duration(seconds: 6));
        await applicationViewModel.navigationService
            .pushReplacementNamed(Routes.login);
      } else {
        await Future.delayed(const Duration(seconds: 6));
        await applicationViewModel.navigationService
            .pushReplacementNamed(Routes.petScreen);
      }
    });
    notifyListeners();
  }

  // Listen for connectivity changes
  void checkConnectivityState() async {
    connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      isConnected = await InternetConnectionChecker().hasConnection;
      if (!isConnected && isAlertSet == false) {
        dialogBox();
        isAlertSet = true;
        notifyListeners();
      }
    });
  }

  // dispose active streams
  void disposeStreams() {
    connectivitySubscription.cancel();
    authChange.cancel();
  }

  //dialog box for disabled connectivity
  dialogBox() => Get.dialog(WillPopScope(
        onWillPop: () {
          return Future.value(isConnected);
        },
        child: Scaffold(
          body: SizedBox(
            width: deviceWidth,
            height: deviceHeight,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Network error!',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                        color: MyColors.blue1,
                      )),
                  const SizedBox(height: 8),
                  myCircularProgress(),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.black45,
                    ),
                    onPressed: () async {
                      applicationViewModel.navigationService.pop();
                      isAlertSet = false;
                      notifyListeners();
                      isConnected =
                          await InternetConnectionChecker().hasConnection;
                      if (!isConnected && isAlertSet == false) {
                        dialogBox();
                        isAlertSet = true;
                        notifyListeners();
                      }
                    },
                    child: const Text(
                      'Refresh',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ));
}
