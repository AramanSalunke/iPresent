import 'package:flutter/cupertino.dart';
import 'package:ipresent/app/locator.dart';
import 'package:ipresent/core/enums/helpers/shared_preference_helper.dart';
import 'package:ipresent/core/enums/services/firebase_services/auth_services.dart';
import 'package:ipresent/login/sign_In.dart' as signin;
import 'package:stacked/stacked.dart';
import 'package:ipresent/core/enums/user_type.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ipresent/app/routes/routes.dart';
import 'package:ipresent/app/routes/routes.gr.dart';

class SplashScreenModel extends BaseViewModel {
  AuthServices _authServices = locator<AuthServices>();
  SharedPreferencesHelper _preferencesHelper = SharedPreferencesHelper();

  startupLogic(BuildContext context) async {
    if (_authServices.isUserLoggedIn()) {
      var usertype = await _preferencesHelper.getUserType();
      switch (usertype) {
        case UserType.ADMIN:
          break;

        case UserType.USER:
          break;

        default:
        // Util flameUtil = Util();
        // final screenDimensions = await Flame.util.initialDimensions();
        // FluttersGame game = FluttersGame(screenDimensions);
        // TapGestureRecognizer tapSink = TapGestureRecognizer();
        // tapSink.onTapDown = game.onTapDown;
        // tapSink.onTapUp = game.onTapUp;
        // runApp(game.widget);
        // flameUtil.addGestureRecognizer(tapSink);
        // await ExtendedNavigator.root!.replace(Routes.homePage);
        //await ExtendedNavigator.root.replace(Routes.loginScreen);
      }
    } else {
      //await ExtendedNavigator.root!.replace()
      AutoRoute(path: '/SigninUserAndPassword/*', page: SigninUserAndPassword);
    }
  }
}
