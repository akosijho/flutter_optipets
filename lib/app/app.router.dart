// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, unused_import

import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../views/login/login_view.dart';
import '../views/pets_screen/pet_screen_view.dart';
import '../views/splash_screen/splash_screen_view.dart';

class Routes {
  static const String splash = '/';
  static const String login = '/login-view';
  static const String petScreen = '/pet-screen-view';
  static const all = <String>{
    splash,
    login,
    petScreen,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splash, page: SplashScreen),
    RouteDef(Routes.login, page: LoginView),
    RouteDef(Routes.petScreen, page: PetScreenView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    SplashScreen: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const SplashScreen(),
        settings: data,
      );
    },
    LoginView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const LoginView(),
        settings: data,
      );
    },
    PetScreenView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const PetScreenView(),
        settings: data,
      );
    },
  };
}
