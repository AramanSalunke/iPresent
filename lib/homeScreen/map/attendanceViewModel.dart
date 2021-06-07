import 'package:geolocator/geolocator.dart';
import 'package:ipresent/homeScreen/map/attendance.dart';
import 'package:ipresent/splash_Screen/splash_screen_model.dart';
import 'package:ipresent/util/snackbar_ui.dart';

import 'package:ipresent/app/locator.dart';

import 'package:ipresent/models/user.dart';
import 'package:ipresent/core/enums/services/firebase_services/auth_services.dart';

import 'package:location/location.dart';
import 'package:stacked/stacked.dart';
import 'dart:async';
import 'package:flutter/material.dart';

import 'package:stacked_services/stacked_services.dart';

class AttendanceViewModel extends BaseViewModel {
  final Geolocator geolocator = Geolocator();
  SnackbarService _snackbarService = locator<SnackbarService>();
  AuthServices _authServices = locator<AuthServices>();

  LocationData? _currentLocationData;
  Position? currentPosition;
  String? _isoCountryCode = "";

  SplashScreenModel _splashScreenViewModel = SplashScreenModel();
  Attendance? _attandance;
  double? _latitude = 00;
  double? _longitude = 00;
  double? _altitude;
  String? status = "";
  String? dateTime = "";
  String? greetings = "";
  get mygreetings => greetings;
  get attendanceStatus => status;
  get attendanceDate => dateTime;
  get latitude => _latitude;
  notifyListeners();
  get longitude => _longitude;

  setLocation() async {
    await Geolocator.getPositionStream().listen((position) {
      currentPosition = position;
      _latitude = currentPosition!.latitude;
      _longitude = currentPosition!.longitude;
      _altitude = currentPosition!.altitude;
      notifyListeners();
    });
  }

  register(AppUser user, BuildContext context) async {
    LocationPermission permission = await Geolocator.requestPermission();
    print("permition=$permission");
    await setLocation();
    _attandance = new Attendance();
    await _attandance!.register(user, _latitude!, _longitude!, _altitude!,
        _authServices.currentUserEmail().toString());
    status = _attandance!.outputText;
    dateTime = DateTime.now().toString();
    greetings = greeting();

    _attandance!.serverResponseCode == 0
        ? await _snackbarService.showCustomSnackBar(
            message: status!,
            duration: Duration(seconds: 4),
            variant: SnackbarType.Success,
            title: "Welcome",
          )
        : await _snackbarService.showCustomSnackBar(
            message: status!,
            duration: Duration(seconds: 4),
            variant: SnackbarType.Warning,
            title: "Error",
          );
    notifyListeners();
    await Future.delayed(Duration(seconds: 5));
    //await _splashScreenViewModel.startupLogic(context);
  }

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    }
    if (hour < 17) {
      return 'Good Afternoon';
    }
    return 'Good Evening';
  }
}
