import 'package:flutter/material.dart';
import 'package:ipresent/constants/custom_appbar.dart';
import 'package:ipresent/dashboard/dashboard_View_screen.dart';
import 'package:ipresent/dashboard/drawer/side_menu.dart';
import 'package:ipresent/dashboard/responsive.dart';
import 'package:provider/provider.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xFF212332),
      appBar: CustomAppBar(
        title: "Dashboard",
        child: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
          size: 20,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      // key: context.read<MenuController>().scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                flex: 5,
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: DashboardViewScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
