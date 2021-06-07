import 'package:flutter/cupertino.dart';

import 'package:ipresent/homeScreen/map/btlogger.dart';
import 'package:ipresent/homeScreen/map/device.dart';
import 'package:ipresent/homeScreen/map/helper.dart';
import 'package:location/location.dart';
import 'package:flutter/services.dart';

class BTLocation extends ChangeNotifier {
  double? latitude;
  double? longitude;
  double? altitude;

  LocationData? currentLocation;

  BTLogger? _logger;
  Device? _device;

  BTLocation() {
    Helper.write('in BTLocation()');

    this.latitude = currentLocation!.latitude;
    this.longitude = currentLocation!.longitude;
    this.altitude = currentLocation!.altitude;
    notifyListeners();
  }

  void getLocationAsync() async {
    String? error;

    var location = new Location();

    try {
      //var currentLocation ;

      Helper.write('getting location data...');

      currentLocation = await location.getLocation();
      this.latitude = currentLocation!.latitude;
      this.longitude = currentLocation!.longitude;
      this.altitude = currentLocation!.altitude;
      notifyListeners();
      Helper.write(
          'Got it. Latitude : ${this.latitude} | Longitude : ${this.longitude}  |  Altitude : ${this.altitude}');

      Map<String, dynamic> data = {
        'Latitude': '${this.latitude}',
        'Longitude': '${this.longitude}',
        'Altitude': '${this.altitude}'
      };

      error = null!;
    } on PlatformException catch (e) {
      Helper.write('on PlatformException catch (e) {');
      if (e.code == 'PERMISSI ON_DENIED') {
        error = 'Permission denied';
      } else if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        error =
            'Permission denied - please ask the user to enable it from the app settings';
      }

      _device = new Device();
      _logger = new BTLogger(_device!.deviceId!, 'Exception', e.toString(),
          'initPlatformState() async');
      _logger!.Submit();

      //location = null;

      Helper.write('Exception in getting location data. Error = $error');

      throw (e);
    }
  }
}
