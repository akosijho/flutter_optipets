import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_optipets/app/app.locator.dart';
import 'package:flutter_optipets/core/services/firebase_service/auth.dart';
import 'package:flutter_optipets/core/services/navigation/navigation_sevice.dart';
import 'package:flutter_optipets/models/user_object.dart';
import 'package:stacked/stacked_annotations.dart';

@LazySingleton()
class ApplicationViewModel extends ChangeNotifier {
  final NavigationService navigationService = locator<NavigationService>();

  //firebase auth
  final Auth auth = locator<Auth>(); 

  // key for form validation
  final formGlobalKey = GlobalKey<FormState>();

  // store user information
  UserObject? userObject;

  // Controlls navigation on pet, appointment, and profile screen
   ScrollController scrollController = ScrollController();

   //instance of FirebaseFiresore
   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  // Demo list to show querying
  List<String> searchTerms = [
    "Apple",
    "Banana",
    "Mango",
    "Pear",
    "Watermelons",
    "Blueberries",
    "Pineapples",
    "Strawberries",
    "Grapes",
    "Raspberry",
    "Durian",
    "Dragon Fruit",
    "Peach",
    "JackFruit",
    "Cashew",
  ];
}
