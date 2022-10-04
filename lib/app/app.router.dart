// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, unused_import

import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../views/appointment_screen/appointment_view.dart';
import '../views/customer_profile/customer_profile_view.dart';
import '../views/login/login_view.dart';
import '../views/pet_profile/pet_profile_view.dart';
import '../views/pets_screen/pet_screen_view.dart';
import '../views/splash_screen/splash_screen_view.dart';

class Routes {
  static const String splash = '/';
  static const String login = '/login-view';
  static const String petScreen = '/pet-screen-view';
  static const String appointment = '/appointment-view';
  static const String customerProfile = '/customer-profile-view';
  static const String petProfile = '/pet-profile-view';
  static const all = <String>{
    splash,
    login,
    petScreen,
    appointment,
    customerProfile,
    petProfile,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splash, page: SplashScreen),
    RouteDef(Routes.login, page: LoginView),
    RouteDef(Routes.petScreen, page: PetScreenView),
    RouteDef(Routes.appointment, page: AppointmentView),
    RouteDef(Routes.customerProfile, page: CustomerProfileView),
    RouteDef(Routes.petProfile, page: PetProfileView),
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
    AppointmentView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const AppointmentView(),
        settings: data,
      );
    },
    CustomerProfileView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const CustomerProfileView(),
        settings: data,
      );
    },
    PetProfileView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const PetProfileView(),
        settings: data,
      );
    },
  };
}
