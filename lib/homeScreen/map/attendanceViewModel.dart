import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
  final CollectionReference docreferance =
      FirebaseFirestore.instance.collection("Users");

  LocationData? _currentLocationData;
  Position? currentPosition;
  String? _isoCountryCode = "";

  SplashScreenModel _splashScreenViewModel = SplashScreenModel();

  bool isPresent = false;
  get getAttendance => isPresent;
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
    await checkAtendance();
  }

  register(BuildContext context) async {
    LocationPermission permission = await Geolocator.requestPermission();
    print("permition=$permission");
    await setLocation();
    _attandance = new Attendance();
    await _attandance!.register(_latitude!, _longitude!, _altitude!,
        _authServices.user().uid.toString());
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
    // await _splashScreenViewModel.startupLogic(context);
  }

  checkAtendance() async {
    String userUid = await _authServices.user().uid;
    var date = DateTime.now();
    var compareDate = new DateTime(date.year, date.month, date.day);

    docreferance
        .doc(userUid)
        .collection("Attendance")
        .get()
        .then((value) async {
      if (value.docs.isNotEmpty) {
        var attendaceQuery = await docreferance
            .doc(userUid)
            .collection("Attendance")
            .where("date", isGreaterThanOrEqualTo: compareDate)
            .get()
            .then((snapshot) {
          if (snapshot.size != 0) {
            isPresent = true;
            notifyListeners();
          }
        });
      }
    });
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
