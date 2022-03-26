import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ipresent/app/locator.dart';
import 'package:ipresent/core/enums/services/firebase_services/auth_services.dart';
import 'package:stacked/stacked.dart';

class CalendarModel extends BaseViewModel {
  AuthServices _authServices = locator<AuthServices>();
  final CollectionReference docreferance =
      FirebaseFirestore.instance.collection("Users");
  Event? eventData;
  Event? get geteventData => eventData;
  getEventData(DateTime date) async {
    //var eventData;
    String userUid = _authServices.user().uid;
    //var date = DateTime.now();
    var compareDate = new DateTime(date.year, date.month, date.day);

    await docreferance
        .doc(userUid)
        .collection("Attendance")
        .get()
        .then((value) async {
      if (value.docs.isNotEmpty) {
        await docreferance
            .doc(userUid)
            .collection("Attendance")
            .where("punchInDate", isGreaterThanOrEqualTo: compareDate)
            .get()
            .then((snapshot) async {
          if (snapshot.size != 0) {
            // titleString = "Present";
            // punchInTimeStr = snapshot.docs.first.data()["punchInDate"];
            // punchOutTimeStr = snapshot.docs.first.data()["punchOutDate"];
            var data = {
              "title": "Present",
              "punchInTime": snapshot.docs.first.data()["punchInDate"],
              "punchOutTime": snapshot.docs.first.data()["punchOutDate"],
            };
            eventData = await Event.fromMap(data);
            notifyListeners();
            //return eventData;
          }
        });
      }
    });
    //eventData = Event(title: "Absent", punchInTime: "", punchOutTime: "");
    //return eventData;
  }
}

class Event {
  final String? title;
  final String? punchInTime;
  final String? punchOutTime;

  const Event({this.title, this.punchInTime, this.punchOutTime});

  factory Event.fromMap(Map<String, dynamic> map) {
    if (map == null) return null!;

    return Event(
      title: map['title'],
      punchInTime: map['punchInTime'] == null
          ? ""
          : map['punchInTime'].toDate().toString(),
      punchOutTime: map['punchOutTime'] == null
          ? ""
          : map['punchOutTime'].toDate().toString(),
    );
  }

  @override
  String toString() {
    return '$title\nPunch-In Time:$punchInTime \nPunch-Out Time:$punchOutTime';
  }
}
