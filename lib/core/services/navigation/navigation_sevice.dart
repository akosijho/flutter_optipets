import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class NavigationService {
  GlobalKey<NavigatorState> get navigatorKey;

  Future<dynamic>? pushNamed(String routeName, {dynamic arguments, Transition transition = Transition.cupertino});

  Future<dynamic>? pushReplacementNamed(String routeName, {dynamic arguments, Transition transition = Transition.cupertino});

  Future<dynamic>? popAllAndPushNamed(String routeName, {dynamic arguments});

  Future<dynamic>? popUntilFirstAndPushNamed(String routeName,
      {dynamic arguments});

  Future<dynamic>? pushNamedAndRemoveUntil(String? routeName,
      {required RoutePredicate predicate, arguments, int? id});

  void popUntilNamed(String routeName);

  void popUntilPredicate(RoutePredicate routePredicate);

  void popRepeated(int times);

  bool pop({dynamic returnValue});
}
