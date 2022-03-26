import 'package:auto_route/annotations.dart';
import 'package:ipresent/homeScreen/home_Screen.dart';
import 'package:ipresent/login/sign_In.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ipresent/splash_Screen/splash_screen.dart';

// @AdaptiveAutoRouter(
//   routes: <AutoRoute>[
//     AdaptiveRoute(
//       page: SigninUserAndPassword,
//       path: "/SigninUserAndPassword",
//     )
//   ],
//   replaceInRouteName: 'Page,Routes',
// )
// class $MainRoute {}
@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
        page: SigninUserAndPassword,
        path: '/SigninUserAndPassword',
        initial: true),

    //AutoRoute(page: SigninUserAndPassword),
    AutoRoute(page: HomeScreen, path: '/HomeScreen', initial: true),

    AutoRoute(page: SplashScreen, path: '/SplashScreen', initial: true),
  ],
)
class $AppRouter {}
