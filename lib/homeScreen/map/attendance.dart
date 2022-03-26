import 'dart:async';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'package:ipresent/homeScreen/map/helper.dart';
import 'package:ipresent/homeScreen/map/network.dart';
import 'package:ipresent/homeScreen/map/device.dart';
import 'package:ipresent/homeScreen/map/btlocation.dart';
import 'package:ipresent/homeScreen/map/software.dart';
import 'package:ipresent/models/user.dart';

class Attendance extends ChangeNotifier {
  // static const String C_URL_REGISTER_ATTENDANCE =
  //     'https://mpresent.azurewebsites.net/api/attendance/register';

  Device? device = new Device();
  Software? software = new Software();
  Network? network = new Network();
  BTLocation? btLocation;

  String? requestType;
  String? userUid;
  String? deviceId;
  String? outputText = "";
  int? serverResponseCode;
  double? latitude, longitude, altitude;
  DateTime? eventDateTime;
  bool? morningOutdoor, afternoonOutdoor;
  String? outdoorReason, currentReason;
  String? comments;

  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection("Users");
  Attendance() {
    this.morningOutdoor = morningOutdoor;
    this.afternoonOutdoor = afternoonOutdoor;
  }

  Future register(
      double _latitude, double _longitude, double _altitude, String uid) async {
    try {
      //btLocation = new BTLocation();
      // btLocation.getLocationAsync();
      this.latitude = _latitude;
      this.longitude = _longitude;
      this.altitude = _altitude;
      this.userUid = uid;
      Helper.write('Latitude : ${this.latitude}');
      notifyListeners();

      if (await network!.isInternetAvailable()) {
        sendRequestToServer_AttendanceRegistration(uid);
      } else {
        if (network!.connectivityType == 0) {
          this.serverResponseCode = 97;
          this.outputText =
              'Can\'t communicate with the server. Please connect to wifi or enable mobile data';
          notifyListeners();
        } else {
          //await sendRequestToFirebaseDb_AttendanceRegister();
        }
      }
      Helper.write('out register()');
    } catch (e) {
      Helper.write('in attendance.register() exception | ${e.toString()}');
      this.outputText =
          'Some problem occured. Please retry later. (Error AR5016)';
      this.serverResponseCode = 98;
      notifyListeners();
      throw (e);
    }
  }

  void sendRequestToServer_AttendanceRegistration(String uid) async {
    Map<String, dynamic> serverResponse;

    var date = DateTime.now();
    var compareDate = new DateTime(date.year, date.month, date.day);
    try {
      Helper.write('Will now get attendance registration data');

      Map<String, dynamic> commonData = getAttendanceRegistrationData();

      // Uri url = Uri.parse(C_URL_REGISTER_ATTENDANCE);

      Helper.write('About to send details to the server1213');

      _collectionReference
          .doc(uid)
          .collection("Attendance")
          .doc(date.toString())
          .set(commonData);

      // Latitude : 18.4957177 Longitude : 73.9328679

      // await http.post(url, body: commonData).then((response) {
      //   Helper.write(
      //       "-----Response status: ${response.statusCode} | Response body: ${response.body} ");
      //   serverResponse = json.decode(response.body);
      //   print("decoded Body:=$serverResponse");
      //   this.serverResponseCode = serverResponse['ResponseCode'];
      //   this.outputText = serverResponse['Message'];
      //   //this.outputText = (response.statusCode).toString();
      //   notifyListeners();
      // });
      Helper.write('Attendance registration done');
    } catch (e) {}
    Helper.write('getting out of function');
  }

  Map<String, dynamic> getAttendanceRegistrationData() {
    Helper.write('in getAttendanceRegistrationData()');

    var now = new DateTime.now();

    Helper.write('Will now get current reason');

    Helper.write(
        '_currentReason = ${this.currentReason}, Latitude = ${this.latitude}');

    Map<String, dynamic> data = {
//"deviceId": "${this.userEmail}",
      "punchInDate": DateTime.now(),
      "punchOutDate": "",
      "deviceName": "${device!.name}",
      //"EventDateTime": "${now}",
      "Latitude": "${this.latitude}",
      "Longitude": "${this.longitude}",
      "Altitude": "${this.altitude}",
      // "MorningOutdoor": "${this.morningOutdoor}",
      // "AfternoonOutdoor": "${this.afternoonOutdoor}",
      //"Reason": "${this.currentReason}",
      //"Comments": "${this.comments}",
      //"UpdateTimestamp": "{'.sv': 'timestamp'}",
      "Version": "${software!.version}",
      //"Build": "${software!.build}",
      //"Package": "${software!.packageName}"
    };
    Helper.write('Following data will be sent...');
    Helper.write(data.toString());

    return data;
  }
}
