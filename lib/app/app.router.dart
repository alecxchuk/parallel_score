// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../ui/views/add_users/add_users.dart';
import '../ui/views/chat_detail/chat_detail.dart';
import '../ui/views/chat_page/chat_page.dart';
import '../ui/views/home/home.dart';
import '../ui/views/login/login_view.dart';
import '../ui/views/signup/signup_view.dart';

class Routes {
  static const String loginView = '/';
  static const String signupView = '/signup-view';
  static const String homeView = '/home-view';
  static const String chatPageView = '/chat-page-view';
  static const String chatDetailView = '/chat-detail-view';
  static const String addUsers = '/add-users';
  static const all = <String>{
    loginView,
    signupView,
    homeView,
    chatPageView,
    chatDetailView,
    addUsers,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.signupView, page: SignupView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.chatPageView, page: ChatPageView),
    RouteDef(Routes.chatDetailView, page: ChatDetailView),
    RouteDef(Routes.addUsers, page: AddUsers),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    LoginView: (data) {
      var args = data.getArgs<LoginViewArguments>(
        orElse: () => LoginViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginView(key: args.key),
        settings: data,
      );
    },
    SignupView: (data) {
      var args = data.getArgs<SignupViewArguments>(
        orElse: () => SignupViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignupView(key: args.key),
        settings: data,
      );
    },
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const HomeView(),
        settings: data,
      );
    },
    ChatPageView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ChatPageView(),
        settings: data,
      );
    },
    ChatDetailView: (data) {
      var args = data.getArgs<ChatDetailViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => ChatDetailView(
          key: args.key,
          receiverId: args.receiverId,
          avatarUrl: args.avatarUrl,
          chatName: args.chatName,
        ),
        settings: data,
      );
    },
    AddUsers: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const AddUsers(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// LoginView arguments holder class
class LoginViewArguments {
  final Key? key;
  LoginViewArguments({this.key});
}

/// SignupView arguments holder class
class SignupViewArguments {
  final Key? key;
  SignupViewArguments({this.key});
}

/// ChatDetailView arguments holder class
class ChatDetailViewArguments {
  final Key? key;
  final String receiverId;
  final String avatarUrl;
  final String chatName;
  ChatDetailViewArguments(
      {this.key,
      required this.receiverId,
      required this.avatarUrl,
      required this.chatName});
}
