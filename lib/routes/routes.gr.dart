// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../modules/board/board.dart';
import '../modules/jobboard/jobboard.dart';
import '../modules/login/login.dart';
import '../modules/reset/reset.dart';
import '../modules/verify/verify.dart';

class Routes {
  static const String loginScreen = '/';
  static const String boardScreen = '/board';
  static const String jobBoardScreen = '/jobboard';
  static const String resetScreen = '/reset';
  static const String verifyScreen = '/verify';
  static const all = <String>{
    loginScreen,
    boardScreen,
    jobBoardScreen,
    resetScreen,
    verifyScreen,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.loginScreen, page: LoginScreen),
    RouteDef(Routes.boardScreen, page: BoardScreen),
    RouteDef(Routes.jobBoardScreen, page: JobBoardScreen),
    RouteDef(Routes.resetScreen, page: ResetScreen),
    RouteDef(Routes.verifyScreen, page: VerifyScreen),
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
    BoardScreen: (data) {
      final args = data.getArgs<BoardScreenArguments>(nullOk: false);
      return MaterialPageRoute<BoardScreen>(
        builder: (context) => BoardScreen(boardId: args.boardId),
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
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// BoardScreen arguments holder class
class BoardScreenArguments {
  final String boardId;
  BoardScreenArguments({@required this.boardId});
}
