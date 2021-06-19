import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipresent/app/locator.dart';
import 'package:ipresent/core/enums/helpers/shared_preference_helper.dart';
import 'package:ipresent/core/enums/services/firebase_services/auth_services.dart';
import 'package:ipresent/login/sign_In.dart' as signin;
import 'package:ipresent/login/signinScreen.dart';
import 'package:ipresent/splash_Screen/login_Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:ipresent/core/enums/user_type.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ipresent/app/routes/routes.dart';
import 'package:ipresent/app/routes/routes.gr.dart';
import 'package:ipresent/homeScreen/home_screen.dart' as home;
import 'package:ipresent/login/resetPassword.dart';
import 'package:ipresent/login/sign_Up.dart';
import 'package:ipresent/models/sign_Up_model.dart';
import 'package:ipresent/login/signinScreen.dart';
import 'package:ipresent/login/footer_Signin.dart';
import 'package:ipresent/login/type_login.dart';
import 'package:ipresent/splash_Screen/splash_screen.dart';
import 'package:ipresent/util/snackbar_ui.dart';

class SplashScreenModel extends BaseViewModel {
  AuthServices _authServices = locator<AuthServices>();
  SharedPreferencesHelper _preferencesHelper = SharedPreferencesHelper();

  startupLogic(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    //var usertype = await _preferencesHelper.getLoggedInUserId();
    if (preferences.containsKey('_loggedInUserId')) {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (_buildContest) => home.HomeScreen()));
    } else {
      //await ExtendedNavigator.root!.replace()
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_buildContest) => LoginScreen()));
    }
  }
}
