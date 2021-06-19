import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipresent/app/locator.dart';
import 'package:ipresent/core/enums/firebase_auth_results.dart';
import 'package:ipresent/core/enums/helpers/shared_preference_helper.dart';
import 'package:ipresent/core/enums/services/firebase_services/auth_services.dart';
import 'package:ipresent/homeScreen/home_Screen.dart';
import 'package:ipresent/splash_Screen/splash_screen_model.dart';
import 'package:ipresent/util/snackbar_ui.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SigninModel extends BaseViewModel {
  AuthServices _authServices = locator<AuthServices>();
  SnackbarService _snackbarService = locator<SnackbarService>();
  SharedPreferencesHelper _preferencesHelper = SharedPreferencesHelper();
  SplashScreenModel _splashScreenViewModel = SplashScreenModel();
  String _email = "";
  String _password = "";
  String? _passwordError = null;
  String? _emailError = null;

  setEmail(String userEmail) {
    _email = userEmail;
    notifyListeners();
  }

  setPassword(String userPassword) {
    _password = userPassword;
    if (_password != "") {
      _passwordError = null;
    }
    notifyListeners();
  }

  String getEmailError() {
    return _emailError!;
  }

  String getPasswordError() {
    return _passwordError!;
  }

  login(BuildContext context) async {
    FirebaseAuthResults authResults =
        await _authServices.signIn(_email, _password);

    if (authResults == FirebaseAuthResults.Success) {
      await _snackbarService.showCustomSnackBar(
          message: "Login Successfull",
          duration: Duration(seconds: 4),
          variant: SnackbarType.Success,
          title: "Welcome");
      notifyListeners();
      await _splashScreenViewModel.startupLogic(context);
      //AutoRoute(path: '/HomeScreen/*', page: HomeScreen);
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => HomeScreen()),
      // );
    } else {
      await _snackbarService.showCustomSnackBar(
        message: _errorType(authResults),
        duration: Duration(seconds: 4),
        variant: SnackbarType.Error,
        title: "Error",
      );
    }
  }
}

String _errorType(FirebaseAuthResults authResult) {
  switch (authResult) {
    case FirebaseAuthResults.NetworkError:
      return "Please check your connection and try again";
    case FirebaseAuthResults.PasswordNotValid:
      return "Check your password and try again";
    case FirebaseAuthResults.Success:
      return null!;
    case FirebaseAuthResults.TooManyAttempts:
      return "Please try again after some time, too many login request";
    case FirebaseAuthResults.UserNotFound:
      return "Email not registered yet";
    case FirebaseAuthResults.Unknown:
      return "Unknown error, please try again";
    default:
      return "Unknown error, please try again";
  }
}
