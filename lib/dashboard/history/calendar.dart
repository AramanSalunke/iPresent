import 'package:flutter/material.dart';
import 'package:ipresent/constants/custom_appbar.dart';
import 'package:ipresent/dashboard/history/calendar_model.dart';
import 'package:stacked/stacked.dart';
import 'package:table_calendar/table_calendar.dart';

class MonthCalendar extends StatefulWidget {
  const MonthCalendar({Key? key}) : super(key: key);

  @override
  _MonthCalendarState createState() => _MonthCalendarState();
}

class _MonthCalendarState extends State<MonthCalendar> {
  DateTime _selectedDay = DateTime.now();
  DateTime? _focusedDay;
  //var _calendarFormat;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CalendarModel>.reactive(
        viewModelBuilder: () => CalendarModel(),
        onModelReady: (model) async => await model.getEventData(DateTime.now()),
        builder: (context, model, child) => Scaffold(
            appBar: CustomAppBar(
              title: "Attendance History",
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 20,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            body: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(children: [
                TableCalendar(
                  // eventLoader: model.getEventData(_selectedDay),
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: DateTime.now(),
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() async {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                      await model.getEventData(
                          _selectedDay); // update `_focusedDay` here as well
                    });
                  },
                  // calendarFormat: _calendarFormat,
                  // onFormatChanged: (format) {
                  //   setState(() {
                  //     _calendarFormat = format;
                  //   });
                  // },
                ),
                SizedBox(
                  height: 20,
                ),
                _empInfo(model)
              ]),
            )));
  }

  Widget _empInfo(CalendarModel model) {
    return Container(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.08),
      // height: MediaQuery.of(context).size.height * 20,
      // width: MediaQuery.of(context).size.width * 0.95,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.08),
            child: Text(
              "Attendance Details",
              style: TextStyle(fontSize: 18, color: Color(0xFFED1E2B)),
              textAlign: TextAlign.center,
            ),
          ),
          Row(children: <Widget>[
            Container(
              child: Icon(Icons.timer),
            ),
            Text(
              "Entry Time    : ",
              style: TextStyle(fontSize: 16, color: Color(0xFFED1E2B)),
              textAlign: TextAlign.start,
            ),
            Text(
              model.geteventData == null
                  ? ""
                  : model.geteventData!.punchInTime.toString(),
              style: TextStyle(fontSize: 16, color: Color(0xFF171717)),
              textAlign: TextAlign.start,
            ),
          ]),
          Row(children: <Widget>[
            Container(
              child: Icon(Icons.timer_off),
            ),
            Text(
              "Exit Time      : ",
              style: TextStyle(fontSize: 16, color: Color(0xFFED1E2B)),
              textAlign: TextAlign.start,
            ),
            Text(
              model.geteventData == null
                  ? ""
                  : model.geteventData!.punchOutTime.toString(),
              style: TextStyle(fontSize: 14, color: Color(0xFF171717)),
              textAlign: TextAlign.start,
            ),
          ]),
          // Row(children: <Widget>[
          //   Container(
          //     child: Icon(Icons.access_time),
          //   ),
          //   Text(
          //     "Total Hours  : ",
          //     style: TextStyle(fontSize: 16, color: Color(0xFFED1E2B)),
          //     textAlign: TextAlign.start,
          //   ),
          //   Text(
          //     widget.totalhours,
          //     style: TextStyle(fontSize: 14, color: Color(0xFF171717)),
          //     textAlign: TextAlign.start,
          //   )
          // ]),
        ],
      ),
    );
  }
}
