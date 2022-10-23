import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_optipets/app/app.locator.dart';
import 'package:flutter_optipets/app/app.router.dart';
import 'package:flutter_optipets/models/user_object.dart';
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
        // print(user.displayName);
        applicationViewModel.userObject =
            applicationViewModel.auth.userFromFirebase(user);

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
            print(applicationViewModel.userObject);
          },
          onError: (e) => print("Error getting document: $e"),
        );

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
          resizeToAvoidBottomInset: false,
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
