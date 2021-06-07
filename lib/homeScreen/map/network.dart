import 'dart:io';
import 'package:connectivity/connectivity.dart';

import 'package:ipresent/homeScreen/map//helper.dart';

class Network {
  int? connectivityType = 0;

  Network() {
    checkConnectivityTypeAsync();
  }

  Future checkConnectivityTypeAsync() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    Helper.write('Checking connectivity type');
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      Helper.write('Connected to mobile data');
      connectivityType = 1;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
      Helper.write('Connected to wifi');
      connectivityType = 2;
    } else {
      Helper.write('Neither wifi nor mobile data');
      connectivityType = 0;
    }
  }

  isInternetAvailable() async {
    Helper.write('Checking if internet is available');
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        Helper.write('connected');
        //return false;   // use this to test network connectivity thingy
        return true;
      }
    } on SocketException catch (e) {
      Helper.write('not connected');
      return false;
      //return true;    // use this to test network connectivity thingy
    }
  }
}
