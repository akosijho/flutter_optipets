import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_optipets/app/app.locator.dart';
import 'package:flutter_optipets/app/app.router.dart';
import 'package:flutter_optipets/core/services/navigation/navigation_sevice.dart';
import 'package:flutter_optipets/utils/constants.dart';
import 'package:flutter_optipets/utils/my_colors.dart';
import 'package:flutter_optipets/views/widgets/my_circular_progress.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:stacked/stacked_annotations.dart';

@LazySingleton(asType: SplashScreenViewModel)
class SplashScreenViewModel extends ChangeNotifier {
  final NavigationService navigationService = locator<NavigationService>();
  late StreamSubscription connectivitySubscription;
  bool isConnected = false;
  bool isAlertSet = false;

  void init() async {
    await Future.delayed(const Duration(seconds: 6));
    navigationService.pushReplacementNamed(Routes.login);
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
                      navigationService.pop();
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
