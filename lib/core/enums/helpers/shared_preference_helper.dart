import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:ipresent/core/enums/user_type.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  SharedPreferences? _sharedPreferences;
  final String _loggedInUserId = '_loggedInUserId';
  final String _loggedInUserEmailId = '_loggedInUserEmailId';
  final String _userName = '_userName';
  final String _userSurname = '_userSurname';
  final String _userType = 'userType';

  SharedPreferencesHelper() {
    _init()!;
  }
  _init() async {
    if (_sharedPreferences == null)
      _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<bool> setLoggedInUserId(String id) async {
    await _init();
    bool res = await _sharedPreferences!.setString(_loggedInUserId, id);
    debugPrint('User Id Saved' + res.toString());
    return res;
  }

  Future<String> getLoggedInUserId() async {
    await _init();
    String res = _sharedPreferences!.getString(_loggedInUserId)!;
    debugPrint('User Id Retrived' + res.toString());
    return res;
  }

  Future<bool> setLoggedInUserEmailId(String emailId) async {
    await _init();
    bool res =
        await _sharedPreferences!.setString(_loggedInUserEmailId, emailId);
    debugPrint('User Email Id Saved' + res.toString());
    return res;
  }

  Future<String> getLoggedInUserEmailId(String emailId) async {
    await _init();
    String res = _sharedPreferences!.getString(_loggedInUserEmailId)!;
    debugPrint('User Email Id Retrived' + res.toString());
    return res;
  }

  Future<bool> setUserName(String name) async {
    await _init();
    bool res = await _sharedPreferences!.setString(_userName, name);
    debugPrint('User name Saved' + res.toString());
    return res;
  }

  Future<String> getUserName() async {
    await _init();
    String username = _sharedPreferences!.getString(_userName) ?? "";
    debugPrint('User name Returned=' + _userName);
    return username;
  }

  Future<bool> setUserSurname(String userSurname) async {
    await _init();
    bool res = await _sharedPreferences!.setString(_userSurname, userSurname);
    debugPrint('User surname Saved' + res.toString());
    return res;
  }

  Future<String> getUserSurname() async {
    await _init();
    String userSurname = _sharedPreferences!.getString(_userSurname)!;
    debugPrint('User surname Returned' + _userSurname);
    return userSurname;
  }

  bool isUserLoggedIn() {
    return _sharedPreferences!.containsKey(_loggedInUserId);
  }

  Future<bool> clearAllData() async {
    await _init();
    bool res = await _sharedPreferences!.clear();
    debugPrint('All Data Cleared: ' + res.toString());
    return res;
  }

  Future<bool> setUserType(UserType userType) async {
    await _init();
    bool res = await _sharedPreferences!.setString(_userType, userType.code!);
    debugPrint('User Type Saved' + userType.code! + '' + res.toString());
    return res;
  }

  Future<UserType> getUserType() async {
    await _init();
    String userType =
        _sharedPreferences!.getString(_userType) ?? UserType.UNKNOWN.code!;
    debugPrint('User Type Returned' + userType);
    return userType.userTypeValue;
  }
}
