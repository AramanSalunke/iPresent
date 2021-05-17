import 'package:flutter/cupertino.dart';
import 'package:ipresent/app/locator.dart';
import 'package:ipresent/core/enums/firebase_auth_results.dart';
import 'package:ipresent/core/enums/services/firebase_services/auth_services.dart';
import 'package:ipresent/util/snackbar_ui.dart';
import 'package:stacked/stacked.dart';
import 'package:ipresent/core/enums/helpers/shared_preference_helper.dart';
import 'package:stacked_services/stacked_services.dart';

class SignUpModel extends BaseViewModel {
  AuthServices _authServices = locator<AuthServices>();
  SharedPreferencesHelper _sharedPreferencesHelper = SharedPreferencesHelper();
  SnackbarService _snackbarService = locator<SnackbarService>();
  String? email;
  String? password;
  String? repeatPassword;

  String? name;
  String? surname;
  String? passwordError = null;

  getEmail(String userEmail) {
    email = userEmail;
    notifyListeners();
  }

  getPassword(String userPassword) {
    password = userPassword;
    if (password != "") {
      passwordError = null;
    }
    notifyListeners();
  }

  getRepeatPassword(String userRepeatPassword) {
    repeatPassword = userRepeatPassword;
    if (repeatPassword != "") {
      passwordError = null;
    }
    notifyListeners();
  }

  getName(String userName) {
    name = userName;
  }

  getsurName(String userSurname) {
    surname = userSurname;
  }

  register() async {
    //await _sharedPreferencesHelper.clearAllData();
    FirebaseAuthResults authResults =
        await _authServices.signUp(email!, password!);
    if (authResults == FirebaseAuthResults.Success) {
      await _snackbarService.showCustomSnackBar(
        message: "Signed Up Successfully",
        duration: Duration(seconds: 4),
        variant: SnackbarType.Success,
        title: "Welcome",
      );
      notifyListeners();
    } else {
      await _snackbarService.showCustomSnackBar(
        message: _errorType(authResults),
        duration: Duration(seconds: 4),
        variant: SnackbarType.Error,
        title: "Error",
      );
      notifyListeners();
    }
  }

  String _errorType(FirebaseAuthResults authResult) {
    switch (authResult) {
      case FirebaseAuthResults.NetworkError:
        return "Please check your connection and try again";
      case FirebaseAuthResults.PasswordNotValid:
        return "Check your password and try again";
      case FirebaseAuthResults.Success:
        return "Registered Successfully";
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
}
