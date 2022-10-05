import 'package:flutter/material.dart';
import 'package:flutter_optipets/app/app.locator.dart';
import 'package:flutter_optipets/core/services/navigation/navigation_sevice.dart';
import 'package:stacked/stacked_annotations.dart';

@LazySingleton()
class ApplicationViewModel extends ChangeNotifier {
  final NavigationService navigationService = locator<NavigationService>();

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
