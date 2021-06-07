import 'package:device_info/device_info.dart';
import 'dart:io';
//import 'package:android_multiple_identifier/android_multiple_identifier.dart';
import 'package:ipresent/homeScreen/map/btlogger.dart';
import 'package:ipresent/homeScreen/map/helper.dart';

class Device {
  bool? isIOS;
  String? deviceId;
  String? model;
  String? name;
  String? manufacturer;
  String? deviceVersion;
  String? softwareVersion;
  String? osName;
  String? androidBoard;
  String? androidBrand;
  String? androidIndustrialDeviceName;
  String? androidNameOfHardware;
  String? imeiNo;
  Device() {
    getDeviceDetailsAsync();
  }

  getDeviceDetailsAsync() async {
    String? identifier;

    //mpDevice myDevice = new mpDevice();
    //await AndroidMultipleIdentifier.requestPermission();
    // Get device information async
    // Map idMap = await AndroidMultipleIdentifier.idMap;
    Helper.write('in getDeviceDetailsAsync()');
    final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        Helper.write('Hmm, this is an Android device.');
        var build = await deviceInfoPlugin.androidInfo;
        identifier = build.androidId; // Android Device id
        deviceVersion = build.version.toString();
        this.manufacturer = build.manufacturer;
        this.model = build.model;
        //this.imeiNo = idMap["imei"];
        this.androidBoard = build.board;
        this.androidIndustrialDeviceName = build.device;
        this.androidNameOfHardware = build.hardware;
        this.softwareVersion = build.version.release;
        Helper.write('Okay, got the device details');
      } else if (Platform.isIOS) {
        Helper.write('Hmm, this is an iOS device.');
        var data = await deviceInfoPlugin.iosInfo;
        this.name = data.name;
        this.imeiNo = '';
        deviceVersion = data.systemVersion;
        identifier = data.identifierForVendor; //UUID for iOS
        Helper.write('Okay, got the device details');
        this.manufacturer = 'Apple';
        this.model = data.utsname.machine;
        Helper.write(
            'data.model=${data.model} .name = ${data.name}, data.systemVersion = ${data.systemVersion}, ${data.utsname.sysname} | ${data.utsname.nodename} | ${data.utsname.release} | ${data.utsname.sysname} | ${data.utsname.version} | ${data.utsname.machine}');
        this.name = data.name;
        this.softwareVersion = data.systemVersion;
        this.osName = data.systemName;
      }
      Helper.write('Just above setting deviceId');
      this.deviceId = identifier;

      Helper.write('Device id : ${this.deviceId}');
    } catch (e) {
      Helper.write('Failed to get platform version');

      BTLogger logger = new BTLogger(
          this.deviceId!, 'Exception', e.toString(), 'getVersionInfo() async');
      logger.Submit();
    }

    //if (!mounted) return;
    //return [deviceName, deviceVersion, identifier];
  }
}
