import 'package:ipresent/homeScreen/map//btlogger.dart';
import 'package:ipresent/homeScreen/map//helper.dart';
import 'package:package_info/package_info.dart';

class Software {
  String? deviceId;
  String? version;
  String? build;
  String? packageName;

  Software() {
    this.deviceId = deviceId;
    getVersionInfo();
  }

  void getVersionInfo() async {
    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();

      this.version = packageInfo.version;
      this.build = packageInfo.buildNumber;
      this.packageName = packageInfo.packageName;
      Helper.write(
          'Version : ${this.version}, Build : ${this.build}, PackageName : ${this.packageName}');
      Map<String, dynamic> data = {
        'Version': '${this.version}',
        'Build': '${this.build}',
        'Package': '${this.packageName}'
      };
    } catch (e) {
      Map<String, dynamic> data = {
        'Version': '${this.version}',
        'Build': '${this.build}',
        'Package': '${this.packageName}'
      };

      BTLogger logger = new BTLogger(
          this.deviceId!, 'Exception', e.toString(), 'getVersionInfo() async');
      logger.Submit();
    }
  }
}
