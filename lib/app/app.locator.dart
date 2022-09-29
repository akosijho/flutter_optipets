// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../core/services/navigation/navigation_service_impl.dart';
import '../core/services/navigation/navigation_sevice.dart';
import '../views/application/application_view_model.dart';

final locator = StackedLocator.instance;

void setupLocator({String? environment, EnvironmentFilter? environmentFilter}) {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton<ApplicationViewModel>(
      () => ApplicationViewModel());
  locator
      .registerLazySingleton<NavigationService>(() => NavigationServiceImpl());
}
