import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipresent/app/locator.dart';
import 'package:ipresent/app/routes/routes.gr.dart';
import 'package:ipresent/core/enums/firebase_auth_results.dart';
import 'package:ipresent/core/enums/services/firebase_services/auth_services.dart';
import 'package:ipresent/login/signinScreen.dart';
import 'package:ipresent/util/snackbar_ui.dart';
import 'package:stacked/stacked.dart';
import 'package:ipresent/core/enums/helpers/shared_preference_helper.dart';
import 'package:stacked_services/stacked_services.dart';

class SignUpModel extends BaseViewModel {
  AuthServices _authServices = AuthServices();
  SharedPreferencesHelper _sharedPreferencesHelper = SharedPreferencesHelper();
  SnackbarService _snackbarService = locator<SnackbarService>();
  final CollectionReference docreferance =
      FirebaseFirestore.instance.collection("Users");
  String? email;
  String? password;
  String? repeatPassword;

  String? name;
  String? surname;
  String? passwordError = null;

  bool isSuccess = false;
  get getIsSuccess => isSuccess;

  final CollectionReference _documentReference =
      FirebaseFirestore.instance.collection('users');

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

  register(BuildContext context) async {
    //isSuccess = false;
    if (validatePassword() == true) {
      //await _sharedPreferencesHelper.clearAllData();
      //String userUid = await _authServices.user().uid;
      // print("userUID=$userUid");
      FirebaseAuthResults authResults =
          await _authServices.signUp(email!, password!);
      String userUid = await _authServices.user().uid;
      Map<String, dynamic> data = {
        'firstName': name,
        'LastName': surname,
        'email': email,
        'uuid': userUid,
      };
      docreferance.doc(userUid).set(data);
      if (authResults == FirebaseAuthResults.Success) {
        isSuccess = true;
        notifyListeners();
        await _snackbarService.showCustomSnackBar(
          message: "Signed Up Successfully",
          duration: Duration(seconds: 4),
          variant: SnackbarType.Success,
          title: "Welcome",
        );
        isSuccess = true;
        notifyListeners();
        //  AutoRoute(path: '/HomeScreen/*', page: HomeScreen);

        // AutoRoute(path: '/SigninUserAndPassword/*', page: SigninUserAndPassword);

        //notifyListeners();
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

  validatePassword() {
    if (email == "") {
      displayErrorMessage("Please enter E-mail");
    } else if (name == "") {
      displayErrorMessage("Please enter Name");
    } else if (surname == "") {
      displayErrorMessage("Please enter Surame");
    } else if (password == "") {
      displayErrorMessage("Please enter Password");
    } else if (repeatPassword == "") {
      displayErrorMessage("Please enter RepeatPassword");
    } else if (password == repeatPassword) {
      return true;
    }
    return false;
  }

  displayErrorMessage(String message) async {
    await _snackbarService.showCustomSnackBar(
      message: message,
      duration: Duration(seconds: 4),
      variant: SnackbarType.Error,
      title: "Error",
    );
  }
}
