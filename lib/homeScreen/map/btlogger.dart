import 'package:http/http.dart' as http;
import 'package:ipresent/homeScreen/map/network.dart';
import 'helper.dart';

class BTLogger {
  String? deviceId;
  String? eventType;
  String? description;
  String? source;

  static Uri C_URL = Uri.parse('');

  BTLogger(
      String DeviceId, String EventType, String Description, String Source) {
    this.deviceId = DeviceId;
    this.eventType = EventType;
    this.description = Description;
    this.source = Source;
  }

  Submit() async {
    Map<String, dynamic> data = {
      'DeviceId': '${deviceId}',
      'EventType': '${eventType}',
      'Description': '${description}',
      'Source': '${source}'
    };

    try {
      Helper.write('in BTLogger.Submit()');
      Network network = new Network();

      if (await network.isInternetAvailable()) {
        http.post(C_URL, body: data).then((response) {
          Helper.write(
              "Exception successfully submitted. Response status = ${response.statusCode} | Response body = ${response.body}");
        });
      }
      Helper.write(
          '-------Exception : $description | Source : $source | EventType : $eventType | : $deviceId ');
    } catch (e) {
      Helper.write('----_________-------');
      // Helper.write(e);
      Helper.write('----_________-------');
    }
  }
}
