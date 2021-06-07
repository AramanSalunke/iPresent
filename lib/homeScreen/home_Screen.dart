import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ipresent/homeScreen/map/attendanceViewModel.dart';

import 'package:ipresent/homeScreen/map/mainAttendance_view.dart';
import 'package:ipresent/login/footer_Signin.dart';
import 'package:ipresent/login/signinScreenWords.dart';
import 'package:ipresent/settings_screen/settings_screen.dart';
import 'package:ipresent/shapes/card1.dart';
import 'package:ipresent/shapes/card2.dart';
import 'package:ipresent/shapes/card3.dart';
import 'package:ipresent/shapes/card4.dart';
import 'package:ipresent/shapes/shapes.dart';
import 'package:stacked/stacked.dart';

class HomeScreen extends StatefulWidget {
  final Color? backgroundColor;
  final String? logo;

  const HomeScreen({this.backgroundColor, this.logo});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SigninScreenWords? signinScreenWords;
  final List<_PositionItem> _positionItems = <_PositionItem>[];
  StreamSubscription<Position>? _positionStreamSubscription;
  AttendanceViewModel _attendanceViewModel = AttendanceViewModel();

  LatLng? latlong;

  GoogleMapController? _controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AttendanceViewModel>.reactive(
      viewModelBuilder: () => AttendanceViewModel(),
      onModelReady: (model) => model.setLocation(),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: MediaQuery.of(context).size.width,
                  color: widget.backgroundColor ?? Color(0xFFE7004C),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 0),
                            child: Hero(
                              tag: 'hero-login',
                              child: Image.asset(
                                "assets/logo_header.png",
                                height: 70,
                                width: 250,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.87,
                      width: MediaQuery.of(context).size.width,
                      decoration: new BoxDecoration(
                        color: Colors.blueGrey[200],
                        // color: Color(0xFFF3F4D9),
                        borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(20.0),
                          topRight: const Radius.circular(20.0),
                        ),
                      ),

                      // alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 45.0),
                      ),
                    ),
                    Positioned.fill(
                      child: CustomPaint(
                        size: Size(
                            MediaQuery.of(context).size.width,
                            (MediaQuery.of(context).size.width *
                                    1.706493443080357)
                                .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                        painter: RPSCustomPainter(),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.8,
                      //color: Colors.yellow,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.016),
                                child: Container(
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      GoogleMap(
                                        initialCameraPosition: CameraPosition(
                                            target: LatLng(model.latitude,
                                                model.longitude),
                                            zoom: 14.0),
                                        onMapCreated:
                                            (GoogleMapController controller) {
                                          _controller = (controller);
                                          _controller!.animateCamera(
                                              CameraUpdate.newCameraPosition(
                                                  CameraPosition(
                                                      target: LatLng(
                                                          model.latitude,
                                                          model.longitude),
                                                      zoom: 14)));
                                        },
                                        //  markers: _markers,
                                        onCameraIdle: () {
                                          setState(() {});
                                        },
                                      )
                                    ],
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.94,
                                  height:
                                      MediaQuery.of(context).size.height * 0.36,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF3F3F5).withOpacity(0.9),
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black45,
                                        blurRadius: 10,
                                        offset: Offset(3, 4), // Shadow position
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Positioned.fill(
                                child: CustomPaint(
                                  child: Column(
                                    children: [
                                      Center(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.03,
                                              left: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.04,
                                              right: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.04),
                                          child: Image.asset(
                                            'assets/history.png',
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.07,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.07,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            bottom: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.03),
                                        child: Text(
                                          'History',
                                          style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.018,
                                            color: Colors.orange[700],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  painter: RPSCustomCard1(),
                                ),
                              ),
                              // NeumorphicButton(
                              //   onPressed: () {
                              //     print("onClick");
                              //   },
                              //   style: NeumorphicStyle(
                              //     shadowLightColor: Colors.black45,
                              //     color: Color(0xFFF3F3F5).withOpacity(0.8),
                              //     shape: NeumorphicShape.concave,
                              //     boxShape: NeumorphicBoxShape.roundRect(
                              //         BorderRadius.circular(30)),
                              //   ),
                              //   padding: EdgeInsets.fromLTRB(
                              //       MediaQuery.of(context).size.width * 0.084,
                              //       MediaQuery.of(context).size.height * 0.02,
                              //       MediaQuery.of(context).size.width * 0.084,
                              //       MediaQuery.of(context).size.height * 0.02),
                              //   child: Column(
                              //     children: [
                              //       Center(
                              //         child: Padding(
                              //           padding: EdgeInsets.all(
                              //               MediaQuery.of(context).size.height *
                              //                   0.01),
                              //           child: Image.asset(
                              //             'assets/history.png',
                              //             height:
                              //                 MediaQuery.of(context).size.height *
                              //                     0.07,
                              //             width:
                              //                 MediaQuery.of(context).size.height *
                              //                     0.07,
                              //           ),
                              //         ),
                              //       ),
                              //       Text(
                              //         'History',
                              //         style: TextStyle(
                              //           fontSize: 13,
                              //           color: Colors.orange[700],
                              //         ),
                              //       )
                              //     ],
                              //   ),
                              // ),
                              Positioned.fill(
                                child: CustomPaint(
                                  child: Column(
                                    children: [
                                      Center(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.03,
                                              left: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.04,
                                              right: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.04),
                                          child: Image.asset(
                                            'assets/notification_bell.png',
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.07,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.07,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            bottom: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.03),
                                        child: Text(
                                          'Notification',
                                          style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.018,
                                            color: Colors.orange[700],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),

                                  // size: Size(
                                  //     MediaQuery.of(context).size.width * 0.35,
                                  //     (MediaQuery.of(context).size.width * 0.35)
                                  //         .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                                  painter: RPSCustomCard2(),
                                ),
                              ),

                              // NeumorphicButton(
                              //   margin: EdgeInsets.only(
                              //       left: MediaQuery.of(context).size.width * 0.04),
                              //   onPressed: () {
                              //     print("onClick");
                              //   },
                              //   style: NeumorphicStyle(
                              //     shadowLightColor: Colors.black45,
                              //     color: Color(0xFFF3F3F5).withOpacity(0.8),
                              //     shape: NeumorphicShape.concave,
                              //     boxShape: NeumorphicBoxShape.roundRect(
                              //         BorderRadius.circular(30)),
                              //   ),
                              //   padding: EdgeInsets.fromLTRB(
                              //       MediaQuery.of(context).size.width * 0.084,
                              //       MediaQuery.of(context).size.height * 0.02,
                              //       MediaQuery.of(context).size.width * 0.084,
                              //       MediaQuery.of(context).size.height * 0.02),
                              //   child: Column(
                              //     children: [
                              //       Center(
                              //         child: Padding(
                              //           padding: EdgeInsets.all(
                              //               MediaQuery.of(context).size.height *
                              //                   0.01),
                              //           child: Image.asset(
                              //             'assets/notification_bell.png',
                              //             height:
                              //                 MediaQuery.of(context).size.height *
                              //                     0.07,
                              //             width:
                              //                 MediaQuery.of(context).size.height *
                              //                     0.07,
                              //           ),
                              //         ),
                              //       ),
                              //       Text(
                              //         'Notification',
                              //         style: TextStyle(
                              //           fontSize: 13,
                              //           color: Colors.orange[700],
                              //         ),
                              //       )
                              //     ],
                              //   ),
                              // ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.055,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Positioned.fill(
                                child: CustomPaint(
                                  child: Column(
                                    children: [
                                      Center(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.03,
                                              left: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.04,
                                              right: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.04),
                                          child: Icon(
                                            Icons.dashboard_rounded,
                                            color: Colors.orange[800],
                                            size: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.07,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            bottom: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.03),
                                        child: Text(
                                          'Dashboard',
                                          style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.018,
                                            color: Colors.orange[700],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  // size: Size(
                                  //   MediaQuery.of(context).size.width,
                                  //   (MediaQuery.of(context).size.width * 0.4)
                                  //       .toDouble(),
                                  // ), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                                  painter: RPSCustomCard3(),
                                ),
                              ),
                              // NeumorphicButton(
                              //     onPressed: () {
                              //       print("onClick");
                              //     },
                              //     style: NeumorphicStyle(
                              //       shadowLightColor: Colors.black45,
                              //       color: Color(0xFFF3F3F5).withOpacity(0.8),
                              //       shape: NeumorphicShape.concave,
                              //       boxShape: NeumorphicBoxShape.roundRect(
                              //           BorderRadius.circular(30)),
                              //     ),
                              //     padding: EdgeInsets.fromLTRB(
                              //         MediaQuery.of(context).size.width * 0.084,
                              //         MediaQuery.of(context).size.height * 0.02,
                              //         MediaQuery.of(context).size.width * 0.084,
                              //         MediaQuery.of(context).size.height * 0.02),
                              //     child: Column(
                              //       children: [
                              //         Center(
                              //           child: Padding(
                              //             padding: EdgeInsets.all(
                              //                 MediaQuery.of(context).size.height *
                              //                     0.01),
                              //             child: Icon(
                              //               Icons.dashboard_rounded,
                              //               color: Colors.orange[800],
                              //               size:
                              //                   MediaQuery.of(context).size.height *
                              //                       0.07,
                              //             ),
                              //           ),
                              //         ),
                              //         Text(
                              //           'Dashboard',
                              //           style: TextStyle(
                              //             fontSize: 13,
                              //             color: Colors.orange[700],
                              //           ),
                              //         )
                              //       ],
                              //     )),
                              Positioned.fill(
                                child: CustomPaint(
                                  child: Column(
                                    children: [
                                      Center(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.03,
                                              left: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.04,
                                              right: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.04),
                                          child: Image.asset(
                                            'assets/settings.png',
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.07,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.07,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            bottom: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.03),
                                        child: Text(
                                          'Settings',
                                          style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.018,
                                            color: Colors.orange[700],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),

                                  // size: Size(
                                  //     MediaQuery.of(context).size.width * 0.35,
                                  //     (MediaQuery.of(context).size.width * 0.35)
                                  //         .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                                  painter: RPSCustomCard4(),
                                ),
                              ),
                              // NeumorphicButton(
                              //   margin: EdgeInsets.only(
                              //       left: MediaQuery.of(context).size.width * 0.04),
                              //   onPressed: () {
                              //     Navigator.of(context).push(MaterialPageRoute(
                              //         builder: (_buildContest) =>
                              //             Settings_Screen()));
                              //     print("onClick");
                              //   },
                              //   style: NeumorphicStyle(
                              //     shadowLightColor: Colors.black45,
                              //     color: Color(0xFFF3F3F5).withOpacity(0.8),
                              //     shape: NeumorphicShape.concave,
                              //     boxShape: NeumorphicBoxShape.roundRect(
                              //         BorderRadius.circular(30)),
                              //   ),
                              //   padding: EdgeInsets.fromLTRB(
                              //       MediaQuery.of(context).size.width * 0.084,
                              //       MediaQuery.of(context).size.height * 0.02,
                              //       MediaQuery.of(context).size.width * 0.084,
                              //       MediaQuery.of(context).size.height * 0.02),
                              //   child: Column(
                              //     children: [
                              //       Center(
                              //         child: Padding(
                              //           padding: EdgeInsets.all(
                              //               MediaQuery.of(context).size.height *
                              //                   0.01),
                              //           child: Image.asset(
                              //             'assets/settings.png',
                              //             height:
                              //                 MediaQuery.of(context).size.height *
                              //                     0.07,
                              //             width:
                              //                 MediaQuery.of(context).size.height *
                              //                     0.07,
                              //           ),
                              //         ),
                              //       ),
                              //       Text(
                              //         'Settings',
                              //         style: TextStyle(
                              //           fontSize: 13,
                              //           color: Colors.orange[700],
                              //         ),
                              //       )
                              //     ],
                              //   ),
                              // ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: this.widgetFooter(),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.41),
                  decoration: BoxDecoration(
                    //shape: BoxShape.circle,
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xFFF3F3F5).withOpacity(0.8),
                  ),
                  height: MediaQuery.of(context).size.height * 0.13,
                  width: MediaQuery.of(context).size.width * 0.28,
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            onPressed: () => _controller!.animateCamera(
              CameraUpdate.newCameraPosition(CameraPosition(
                  target: LatLng(model.latitude, model.longitude), zoom: 18)),
            ),
            child: const Icon(Icons.center_focus_strong),
          ),
        ),
      ),
    );
  }

  Widget widgetFooter() {
    return SigninScreenFooter(
      logo: 'assets/logo_header.png',
      text: 'Powered by',
      funFooterLogin: () {},
    );
  }
}

enum _PositionItemType {
  permission,
  position,
}

class _PositionItem {
  _PositionItem(this.type, this.displayValue);

  final _PositionItemType type;
  final String displayValue;
}
