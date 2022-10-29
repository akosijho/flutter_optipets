// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i10;
import 'package:flutter/material.dart';
import 'package:flutter_optipets/models/pet_object.dart' as _i11;
import 'package:flutter_optipets/views/appointment_screen/appointment_view.dart'
    as _i5;
import 'package:flutter_optipets/views/chat_screen/chats_view.dart' as _i8;
import 'package:flutter_optipets/views/chat_screen/conversation_view/conversation_view.dart'
    as _i9;
import 'package:flutter_optipets/views/customer_profile/customer_profile_view.dart'
    as _i6;
import 'package:flutter_optipets/views/login/login_view.dart' as _i3;
import 'package:flutter_optipets/views/pet_profile/pet_profile_view.dart'
    as _i7;
import 'package:flutter_optipets/views/pets_screen/pet_screen_view.dart' as _i4;
import 'package:flutter_optipets/views/splash_screen/splash_screen_view.dart'
    as _i2;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i12;

class Routes {
  static const splash = '/';

  static const login = '/login-view';

  static const petScreen = '/pet-screen-view';

  static const appointment = '/appointment-view';

  static const customerProfile = '/customer-profile-view';

  static const petProfile = '/pet-profile-view';

  static const chatsView = '/chats-view';

  static const conversationView = '/conversation-view';

  static const all = <String>{
    splash,
    login,
    petScreen,
    appointment,
    customerProfile,
    petProfile,
    chatsView,
    conversationView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.splash,
      page: _i2.SplashScreen,
    ),
    _i1.RouteDef(
      Routes.login,
      page: _i3.LoginView,
    ),
    _i1.RouteDef(
      Routes.petScreen,
      page: _i4.PetScreenView,
    ),
    _i1.RouteDef(
      Routes.appointment,
      page: _i5.AppointmentView,
    ),
    _i1.RouteDef(
      Routes.customerProfile,
      page: _i6.CustomerProfileView,
    ),
    _i1.RouteDef(
      Routes.petProfile,
      page: _i7.PetProfileView,
    ),
    _i1.RouteDef(
      Routes.chatsView,
      page: _i8.ChatsView,
    ),
    _i1.RouteDef(
      Routes.conversationView,
      page: _i9.ConversationView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.SplashScreen: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i2.SplashScreen(),
        settings: data,
      );
    },
    _i3.LoginView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i3.LoginView(),
        settings: data,
      );
    },
    _i4.PetScreenView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i4.PetScreenView(),
        settings: data,
      );
    },
    _i5.AppointmentView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i5.AppointmentView(),
        settings: data,
      );
    },
    _i6.CustomerProfileView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i6.CustomerProfileView(),
        settings: data,
      );
    },
    _i7.PetProfileView: (data) {
      final args = data.getArgs<PetProfileViewArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) =>
            _i7.PetProfileView(key: args.key, petObject: args.petObject),
        settings: data,
      );
    },
    _i8.ChatsView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i8.ChatsView(),
        settings: data,
      );
    },
    _i9.ConversationView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i9.ConversationView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class PetProfileViewArguments {
  const PetProfileViewArguments({
    this.key,
    required this.petObject,
  });

  final _i10.Key? key;

  final _i11.PetObject petObject;
}

extension NavigatorStateExtension on _i12.NavigationService {
  Future<dynamic> navigateToSplashScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.splash,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.login,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPetScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.petScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAppointmentView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.appointment,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCustomerProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.customerProfile,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPetProfileView({
    _i10.Key? key,
    required _i11.PetObject petObject,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.petProfile,
        arguments: PetProfileViewArguments(key: key, petObject: petObject),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToChatsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.chatsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToConversationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.conversationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
