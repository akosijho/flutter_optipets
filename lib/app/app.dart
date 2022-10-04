import 'package:flutter_optipets/core/services/navigation/navigation_service_impl.dart';
import 'package:flutter_optipets/core/services/navigation/navigation_sevice.dart';
import 'package:flutter_optipets/views/appointment_screen/appointment_view.dart';
import 'package:flutter_optipets/views/customer_profile/customer_profile_view.dart';
import 'package:flutter_optipets/views/login/login_view.dart';
import 'package:flutter_optipets/views/pet_profile/pet_profile_view.dart';
import 'package:flutter_optipets/views/pets_screen/pet_screen_view.dart';
import 'package:flutter_optipets/views/splash_screen/splash_screen_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:flutter_optipets/views/application/application_view_model.dart';

@StackedApp(routes: [
  AdaptiveRoute(page: SplashScreen, name: "splash", initial: true),
  AdaptiveRoute(page: LoginView, name: "login"),
  AdaptiveRoute(page: PetScreenView, name: "petScreen"),
  AdaptiveRoute(page: AppointmentView, name: "appointment"),
  AdaptiveRoute(page: CustomerProfileView, name: "customerProfile"),
  AdaptiveRoute(page: PetProfileView, name: "petProfile"),
], dependencies: [
  LazySingleton(classType: ApplicationViewModel, asType: ApplicationViewModel),
  LazySingleton(classType: NavigationServiceImpl, asType: NavigationService),
])
class App {}
