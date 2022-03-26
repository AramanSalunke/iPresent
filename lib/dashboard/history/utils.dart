import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ipresent/app/locator.dart';
import 'package:ipresent/core/enums/services/firebase_services/auth_services.dart';
import 'package:table_calendar/table_calendar.dart';

/// Example event class.
class Event {
  final String? title;
  final String? punchInTime;
  final String? punchOutTime;

  const Event({this.title, this.punchInTime, this.punchOutTime});

  factory Event.fromMap(Map<String, dynamic> map) {
    if (map == null) return null!;

    return Event(
      title: map['title'],
      punchInTime: map['punchInTime'].toDate(),
      punchOutTime: map['punchInTime'].toDate(),
    );
  }

  @override
  String toString() {
    return '$title\nPunch-In Time:$punchInTime \nPunch-Out Time:$punchOutTime';
  }
}

/// Example events.
///
/// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);

final _kEventSource = Map.fromIterable(List.generate(50, (index) => index),
    key: (item) => DateTime.utc(2020, 10, item * 5),
    value: (item) => List.generate(
        item % 4 + 1,
        (index) => Event(
            title: 'Event $item | ${index + 1}',
            punchInTime: '10:00 AM',
            punchOutTime: '05:00 PM')))
  ..addAll({
    DateTime.now(): [
      Event(
          title: 'Present', punchInTime: '11:00 AM', punchOutTime: '05:00 PM'),
      //getEventData(DateTime.now())
      // Event(titleString, punchInTimeStr, punchOutTimeStr)
      // Event('Today\'s Event 2', '10:30 AM', '05:00 PM'),
    ],
  });

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

getEventData(DateTime date) async {
  var eventData;
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
          .where("date", isGreaterThanOrEqualTo: compareDate)
          .get()
          .then((snapshot) {
        if (snapshot.size != 0) {
          // titleString = "Present";
          // punchInTimeStr = snapshot.docs.first.data()["punchInDate"];
          // punchOutTimeStr = snapshot.docs.first.data()["punchOutDate"];
          var data = {
            "title": "Present",
            "punchInTime": snapshot.docs.first.data()["punchInDate"],
            "punchOutTime": snapshot.docs.first.data()["punchOutDate"],
          };
          eventData = Event.fromMap(data);
          return eventData;
        }
      });
    }
  });
  eventData = Event(title: "Absent", punchInTime: "", punchOutTime: "");
  return eventData;
}

final kNow = DateTime.now();
final kFirstDay = DateTime(1);
final kLastDay = DateTime(3000);
AuthServices _authServices = locator<AuthServices>();
final CollectionReference docreferance =
    FirebaseFirestore.instance.collection("Users");
String titleString = "";
String punchInTimeStr = "";
String punchOutTimeStr = "";
