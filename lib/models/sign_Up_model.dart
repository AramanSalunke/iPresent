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
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

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
    if (await validatePassword(context) == true) {
      //await _sharedPreferencesHelper.clearAllData();
      //String userUid = await _authServices.user().uid;
      // print("userUID=$userUid");
      FirebaseAuthResults authResults =
          await _authServices.signUp(email!, password!, context);
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
        showTopSnackBar(
          context,
          CustomSnackBar.success(
            message: "SignUp Successfull",
          ),
        );
        isSuccess = true;
        notifyListeners();
        //  AutoRoute(path: '/HomeScreen/*', page: HomeScreen);

        // AutoRoute(path: '/SigninUserAndPassword/*', page: SigninUserAndPassword);

        //notifyListeners();
      } else {
        showTopSnackBar(
          context,
          CustomSnackBar.error(
            message: _errorType(authResults),
          ),
        );
        notifyListeners();
      }
    } else {
      // showTopSnackBar(
      //   context,
      //   CustomSnackBar.error(
      //     message:"y" ,
      //   ),
      // );
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
      case FirebaseAuthResults.EmailExist:
        return "The email address is already in use by another account";
      default:
        return "Unknown error, please try again";
    }
  }

  validatePassword(BuildContext context) async {
    if (email == "" || email == null) {
      await displayErrorMessage("Please enter E-mail", context);
      return false;
    } else if (name == "" || name == null) {
      await displayErrorMessage("Please enter Name", context);
      return false;
    } else if (surname == "" || surname == null) {
      await displayErrorMessage("Please enter Surame", context);
      return false;
    } else if (password == "" || password == null) {
      await displayErrorMessage("Please enter Password", context);
      return false;
    } else if (repeatPassword == "" || repeatPassword == null) {
      await displayErrorMessage("Please enter RepeatPassword", context);
      return false;
    } else if (password != repeatPassword) {
      await displayErrorMessage("Password doesn't match", context);
      return false;
    }
    return true;
  }

  displayErrorMessage(String message, BuildContext context) async {
    showTopSnackBar(
      context,
      CustomSnackBar.error(
        message: message,
      ),
    );
    notifyListeners();
  }

  notifyListeners();
}
