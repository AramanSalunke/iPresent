import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:ipresent/app/locator.dart';
import 'package:ipresent/core/enums/firebase_auth_results.dart';
import 'package:ipresent/core/enums/helpers/shared_preference_helper.dart';
import 'package:ipresent/core/enums/services/firebase_services/services.dart';
import 'package:ipresent/core/enums/services/firebase_services/firebase_exceptions.dart'
    as FirebaseAuthExceptions;

import 'package:stacked_services/stacked_services.dart';

@singleton
class AuthServices extends Services {
  //SnackbarService _snackbarService = locator<SnackbarService>();
  SharedPreferencesHelper _sharedPreferencesHelper = SharedPreferencesHelper();
  var userData;
  Future getLoggedInUserData() async {
    final DocumentReference _userDocumentReference =
        FirebaseFirestore.instance.collection("Users").doc(user().email);
    DocumentSnapshot userData = await _userDocumentReference.get();
    if (userData.exists) {
    } else {}
  }

  Future<FirebaseAuthResults> signIn(String email, String password) async {
    try {
      await auth().signInWithEmailAndPassword(email: email, password: password);
      if (user() != null) {
        await _sharedPreferencesHelper.setLoggedInUserId(user().uid);
        return FirebaseAuthResults.Success;
      } else {
        return FirebaseAuthResults.Unknown;
      }
    } catch (e) {
      return FirebaseAuthExceptions.FirebaseAuthException.catchException(e);
    }
  }

  resetPassword(String email) async {
    await auth().sendPasswordResetEmail(email: email);
  }

  Future<FirebaseAuthResults> signUp(String email, String password) async {
    try {
      await auth()
          .createUserWithEmailAndPassword(email: email, password: password);
      if (user() != null) {
        await _sharedPreferencesHelper.setLoggedInUserId(user().uid);
        await _sharedPreferencesHelper.setLoggedInUserEmailId(email);
        return FirebaseAuthResults.Success;
      } else {
        return FirebaseAuthResults.Unknown;
      }
    } catch (e) {
      return FirebaseAuthExceptions.FirebaseAuthException.catchException(e);
    }
  }

  String currentUserEmail() {
    String? userid = user().email;
    return userid!;
  }

  signOut() async {
    await _sharedPreferencesHelper.clearAllData();
    await auth().signOut();
  }

  handleGoogleAuth() {}
}
