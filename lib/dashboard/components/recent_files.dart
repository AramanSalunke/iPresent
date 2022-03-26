import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ipresent/dashboard/constants.dart';
import 'package:ipresent/dashboard/history/calendar.dart';
import 'package:ipresent/dashboard/models/RecentFile.dart';

class RecentFiles extends StatelessWidget {
  RecentFiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_buildContext) => MonthCalendar()));
              },
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/june.svg",
                    //   title: "View Attendance History",
                    height: 30,
                    width: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "View Attendance History",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
            ),
            // DataTable(
            //   horizontalMargin: 0,
            //   columnSpacing: defaultPadding,
            //   // columns: [
            //   //   DataColumn(
            //   //     label: Text(
            //   //       "Attendance History",
            //   //       style: TextStyle(
            //   //         fontSize: 18,
            //   //       ),
            //   //     ),
            //   //   ),
            //   //   // DataColumn(
            //   //   //   label: Text("Date"),
            //   //   // ),
            //   //   // DataColumn(
            //   //   //   label: Text("Size"),
            //   //   // ),
            //   // ],
            //   rows: List.generate(
            //     1,
            //     (index) => recentFileDataRow(demoRecentFiles[index], context),
            //   ),
            //   columns: [],
            // ),
          ),
        ],
      ),
    );
  }
}

DataRow recentFileDataRow(RecentFile fileInfo, BuildContext context) {
  return DataRow(
    cells: [
      DataCell(
          Row(
            children: [
              SvgPicture.asset(
                fileInfo.icon!,
                height: 30,
                width: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Text(fileInfo.title!),
              ),
            ],
          ), onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (_buildContext) => MonthCalendar(),
        ));
      }),
      // DataCell(Text(fileInfo.date!)),
      // DataCell(Text(fileInfo.size!)),
    ],
  );
}
