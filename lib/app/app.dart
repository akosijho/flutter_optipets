import 'package:flutter_optipets/core/services/navigation/navigation_service_impl.dart';
import 'package:flutter_optipets/core/services/navigation/navigation_sevice.dart';
import 'package:flutter_optipets/views/login/login_view.dart';
import 'package:flutter_optipets/views/pets_screen/pet_screen_view.dart';
import 'package:flutter_optipets/views/splash_screen/splash_screen_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:flutter_optipets/views/application/application_view_model.dart';

@StackedApp(routes: [
  AdaptiveRoute(page: SplashScreen, name: "splash", initial: true),
  AdaptiveRoute(page: LoginView, name: "login"),
  AdaptiveRoute(page: PetScreenView, name: "petScreen"),
], dependencies: [
  LazySingleton(classType: ApplicationViewModel, asType: ApplicationViewModel),
  LazySingleton(classType: NavigationServiceImpl, asType: NavigationService),
])
class App {}
