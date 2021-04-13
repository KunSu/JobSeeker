// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../modules/home/home.dart';
import '../modules/jobboard/jobboard.dart';
import '../modules/login/login.dart';
import '../modules/map/map.dart';
import '../modules/reset/reset.dart';
import '../modules/verify/verify.dart';

class Routes {
  static const String loginScreen = '/';
  static const String homeScreen = '/home';
  static const String jobBoardScreen = '/jobboard';
  static const String resetScreen = '/reset';
  static const String verifyScreen = '/verify';
  static const String mapScreen = '/map';
  static const all = <String>{
    loginScreen,
    homeScreen,
    jobBoardScreen,
    resetScreen,
    verifyScreen,
    mapScreen,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.loginScreen, page: LoginScreen),
    RouteDef(Routes.homeScreen, page: HomeScreen),
    RouteDef(Routes.jobBoardScreen, page: JobBoardScreen),
    RouteDef(Routes.resetScreen, page: ResetScreen),
    RouteDef(Routes.verifyScreen, page: VerifyScreen),
    RouteDef(Routes.mapScreen, page: MapScreen),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    LoginScreen: (data) {
      return MaterialPageRoute<LoginScreen>(
        builder: (context) => LoginScreen(),
        settings: data,
      );
    },
    HomeScreen: (data) {
      return MaterialPageRoute<HomeScreen>(
        builder: (context) => HomeScreen(),
        settings: data,
      );
    },
    JobBoardScreen: (data) {
      return MaterialPageRoute<JobBoardScreen>(
        builder: (context) => JobBoardScreen(),
        settings: data,
      );
    },
    ResetScreen: (data) {
      return MaterialPageRoute<ResetScreen>(
        builder: (context) => ResetScreen(),
        settings: data,
      );
    },
    VerifyScreen: (data) {
      return MaterialPageRoute<VerifyScreen>(
        builder: (context) => VerifyScreen(),
        settings: data,
      );
    },
    MapScreen: (data) {
      return MaterialPageRoute<MapScreen>(
        builder: (context) => MapScreen(),
        settings: data,
      );
    },
  };
}
