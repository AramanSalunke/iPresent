import 'package:flutter/cupertino.dart';
import 'package:ipresent/app/locator.dart';
import 'package:ipresent/core/enums/firebase_auth_results.dart';
import 'package:ipresent/core/enums/services/firebase_services/auth_services.dart';
import 'package:stacked/stacked.dart';
import 'package:ipresent/core/enums/helpers/shared_preference_helper.dart';

class SignUpModel extends BaseViewModel {
  AuthServices _authServices = locator<AuthServices>();
  SharedPreferencesHelper _sharedPreferencesHelper = SharedPreferencesHelper();
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
  }
}
