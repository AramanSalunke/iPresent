// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../../homeScreen/home_Screen.dart' as _i4;
import '../../login/sign_In.dart' as _i3;
import '../../login/signinScreenWords.dart' as _i6;
import '../../splash_Screen/splash_screen.dart' as _i5;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    SigninUserAndPassword.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<SigninUserAndPasswordArgs>(
              orElse: () => const SigninUserAndPasswordArgs());
          return _i3.SigninUserAndPassword(
              backgroundColor: args.backgroundColor,
              logo: args.logo,
              textColor: args.textColor,
              isFooter: args.isFooter,
              widgetFooter: args.widgetFooter,
              isResetPassword: args.isResetPassword,
              widgetResetPassword: args.widgetResetPassword,
              isSignUp: args.isSignUp,
              signUp: args.signUp,
              callLogin: args.callLogin,
              signinScreenWords: args.signinScreenWords);
        }),
    HomeScreen.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args =
              data.argsAs<HomeScreenArgs>(orElse: () => const HomeScreenArgs());
          return _i4.HomeScreen(
              backgroundColor: args.backgroundColor, logo: args.logo);
        }),
    SplashScreen.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i5.SplashScreen();
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig('/#redirect',
            path: '/', redirectTo: '/SigninUserAndPassword', fullMatch: true),
        _i1.RouteConfig(SigninUserAndPassword.name,
            path: '/SigninUserAndPassword'),
        _i1.RouteConfig(HomeScreen.name, path: '/HomeScreen'),
        _i1.RouteConfig(SplashScreen.name, path: '/SplashScreen')
      ];
}

class SigninUserAndPassword
    extends _i1.PageRouteInfo<SigninUserAndPasswordArgs> {
  SigninUserAndPassword(
      {_i2.Color? backgroundColor,
      String? logo,
      _i2.Color? textColor,
      bool? isFooter,
      _i2.Widget? widgetFooter,
      bool? isResetPassword,
      _i2.Widget? widgetResetPassword,
      bool? isSignUp,
      _i2.Widget? signUp,
      Function? callLogin,
      _i6.SigninScreenWords? signinScreenWords})
      : super(name,
            path: '/SigninUserAndPassword',
            args: SigninUserAndPasswordArgs(
                backgroundColor: backgroundColor,
                logo: logo,
                textColor: textColor,
                isFooter: isFooter,
                widgetFooter: widgetFooter,
                isResetPassword: isResetPassword,
                widgetResetPassword: widgetResetPassword,
                isSignUp: isSignUp,
                signUp: signUp,
                callLogin: callLogin,
                signinScreenWords: signinScreenWords));

  static const String name = 'SigninUserAndPassword';
}

class SigninUserAndPasswordArgs {
  const SigninUserAndPasswordArgs(
      {this.backgroundColor,
      this.logo,
      this.textColor,
      this.isFooter,
      this.widgetFooter,
      this.isResetPassword,
      this.widgetResetPassword,
      this.isSignUp,
      this.signUp,
      this.callLogin,
      this.signinScreenWords});

  final _i2.Color? backgroundColor;

  final String? logo;

  final _i2.Color? textColor;

  final bool? isFooter;

  final _i2.Widget? widgetFooter;

  final bool? isResetPassword;

  final _i2.Widget? widgetResetPassword;

  final bool? isSignUp;

  final _i2.Widget? signUp;

  final Function? callLogin;

  final _i6.SigninScreenWords? signinScreenWords;
}

class HomeScreen extends _i1.PageRouteInfo<HomeScreenArgs> {
  HomeScreen({_i2.Color? backgroundColor, String? logo})
      : super(name,
            path: '/HomeScreen',
            args: HomeScreenArgs(backgroundColor: backgroundColor, logo: logo));

  static const String name = 'HomeScreen';
}

class HomeScreenArgs {
  const HomeScreenArgs({this.backgroundColor, this.logo});

  final _i2.Color? backgroundColor;

  final String? logo;
}

class SplashScreen extends _i1.PageRouteInfo {
  const SplashScreen() : super(name, path: '/SplashScreen');

  static const String name = 'SplashScreen';
}
