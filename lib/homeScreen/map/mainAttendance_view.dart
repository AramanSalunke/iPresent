import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ipresent/homeScreen/map/attendance.dart';
import 'package:ipresent/homeScreen/map/attendanceViewModel.dart';
import 'package:ipresent/homeScreen/map/circularprogres.dart';
import 'package:ipresent/homeScreen/map/flutter_mao_location.dart';
import 'package:ipresent/models/user.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_map/flutter_map.dart';

class AttendanceScreen extends StatefulWidget {
  AppUser? user;
  AttendanceScreen({
    this.user,
  });
  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation? _animation;
  Attendance _attendance = Attendance();

  bool showFingerPrint = false;
  bool isAnimationCompleted = false;
  @override
  void initState() {
    super.initState();

    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller!)
      ..addStatusListener((AnimationStatus status) {
        switch (status) {
          case AnimationStatus.forward:
            break;
          case AnimationStatus.completed:
            isAnimationCompleted = true;
            _controller!.reverse();
            break;
          case AnimationStatus.reverse:
            break;
          case AnimationStatus.dismissed:
            if (isAnimationCompleted) {
              setState(() {
                showFingerPrint = !showFingerPrint;
              });
              isAnimationCompleted = false;
            }
            break;
        }
      });
  }

  _onLongPressStart(LongPressStartDetails details) {
    if (!_controller!.isAnimating) {
      _controller!.forward();
    } else {
      _controller!.forward(from: _controller!.value);
    }
  }

  _onLongPressEnd(LongPressEndDetails details) {
    _controller!.reverse();
  }

  final Location location = Location();
  AnimationController? iconanimation;
  bool isplaying = false;

  List<DropdownMenuItem<String>>? dropDownMenuItems;
  var buttonColor = Colors.deepOrange[400];

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AttendanceViewModel>.reactive(
        viewModelBuilder: () => AttendanceViewModel(),
        // onModelReady: (model) => model.setLocation(),
        builder: (context, model, child) => Scaffold(
              backgroundColor: Colors.white,
              // appBar: CustomAppBar(
              //   title: "Mark Your Attendance",
              //   child: kBackBtn,
              //   onPressed: () async {
              //     Navigator.pop(context);
              //   },
              //   isSearch: false,
              // ),
              body: SingleChildScrollView(
                child: Column(

                    //crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          margin: EdgeInsets.all(8),
                          height: MediaQuery.of(context).size.height / 2 - 48,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: CenterFabExample()),
                      SizedBox(
                        height: 20,
                      ),
                      // buttonRegisterAttendance(context: context, model: model),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                          child: Column(
                        children: [
                          Text(
                            "Punch In Now",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.blue,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            color: Colors.white,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Column(
                                  children: [
                                    Text(
                                      "Today",
                                      style: TextStyle(color: Colors.green),
                                    ),
                                    Text("IN TIME:")
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  children: [
                                    Text(
                                        "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                                        style: TextStyle(color: Colors.green)),
                                    Text("OUT TIME:")
                                  ],
                                ),
                              )
                            ],
                          ),
                          Divider(
                            thickness: 1,
                            color: Colors.teal,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                model.latitude != null
                                    ? Text(
                                        "Current Location",
                                        style: TextStyle(color: Colors.black),
                                      )
                                    : Container(),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: model.latitude != null
                                ? Row(
                                    // crossAxisAlignment: CrossAxisAlignment.start,

                                    children: [
                                        Icon(
                                          Icons.location_on,
                                          size: 40,
                                          color: Colors.green,
                                        ),
                                        Text(
                                            " Latitude    :${model.latitude}\n Longitude :${model.longitude}"),
                                      ])
                                : Container(),
                          ),
                        ],
                      ))
                    ]),
              ),
            ));
  }

  // Widget buttonRegisterAttendance(
  //     {BuildContext? context, AttendanceViewModel? model}) {
  //   return Center(
  //       child: Container(
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(35),
  //       //  color: Colors.blue,
  //     ),
  //     alignment: Alignment.center,
  //     child: Stack(
  //       children: <Widget>[
  //         GestureDetector(
  //           onLongPressStart: _onLongPressStart,
  //           onLongPressEnd: _onLongPressEnd,
  //           child: AnimatedBuilder(
  //               animation: _controller!,
  //               builder: (_, child) {
  //                 return Transform.scale(
  //                   scale: ((_controller!.value * 0.2) + 1),
  //                   child: Container(
  //                     width: MediaQuery.of(context!).size.width,
  //                     padding: EdgeInsets.only(
  //                         top: MediaQuery.of(context).size.height * 0.018,
  //                         bottom: MediaQuery.of(context).size.height * 0.018,
  //                         right: MediaQuery.of(context).size.height * 0.018,
  //                         left: MediaQuery.of(context).size.height * 0.018),
  //                     height: MediaQuery.of(context).size.height,
  //                     child: Stack(
  //                       children: <Widget>[
  //                         CircularProgres(value: _controller!.value),
  //                         Container(
  //                           child: showFingerPrint
  //                               ? Center(
  //                                   child: Icon(
  //                                     Icons.check_circle,
  //                                     color: Colors.greenAccent[400],
  //                                     size: MediaQuery.of(context).size.height *
  //                                         0.08,
  //                                   ),
  //                                 )
  //                               : FingerPrintIcon(value: _controller!.value),
  //                         )
  //                       ],
  //                     ),
  //                     decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(45),
  //                       boxShadow: [
  //                         // BoxShadow(
  //                         //     color: Colors.blue[100]!,
  //                         //     blurRadius: 10,
  //                         //     spreadRadius: 3,
  //                         //     offset: Offset(16, 16)),
  //                       ],
  //                       // shape: BoxShape.circle,
  //                       color: Color(0xFFF3F3F5),
  //                     ),
  //                   ),
  //                 );
  //               }),
  //           onLongPress: () {
  //             model!.register(context!);
  //           },
  //         ),
  //       ],
  //     ),
  //   ));
  //}

  handelOnPress() {
    setState(() {
      isplaying = !isplaying;
      isplaying ? iconanimation!.forward() : iconanimation!.reverse();
    });
  }
}

class CenterFabExample extends StatefulWidget {
  @override
  _CenterFabExampleState createState() => _CenterFabExampleState();
}

class _CenterFabExampleState extends State<CenterFabExample> {
  CenterOnLocationUpdate? _centerOnLocationUpdate;
  StreamController<double>? _centerCurrentLocationStreamController;

  @override
  void initState() {
    super.initState();
    _centerOnLocationUpdate = CenterOnLocationUpdate.always;
    _centerCurrentLocationStreamController = StreamController<double>();
  }

  @override
  void dispose() {
    _centerCurrentLocationStreamController!.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlutterMap(
          options: MapOptions(
              center: LatLng(0, 0),
              zoom: 14,
              maxZoom: 19,
              // Stop centering the location marker on the map if user interacted with the map.
              onPositionChanged: (MapPosition position, bool hasGesture) {
                if (hasGesture) {
                  setState(() =>
                      _centerOnLocationUpdate = CenterOnLocationUpdate.never);
                }
              }),
          children: [
            TileLayerWidget(
              options: TileLayerOptions(
                urlTemplate:
                    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: ['a', 'b', 'c'],
                maxZoom: 19,
              ),
            ),
            LocationMarkerLayerWidget(
              plugin: LocationMarkerPlugin(
                centerCurrentLocationStream:
                    _centerCurrentLocationStreamController!.stream,
                centerOnLocationUpdate: _centerOnLocationUpdate!,
              ),
            ),
            Positioned(
              right: 20,
              bottom: 20,
              child: FloatingActionButton(
                onPressed: () {
                  // Automatically center the location marker on the map when location updated until user interact with the map.
                  setState(() =>
                      _centerOnLocationUpdate = CenterOnLocationUpdate.always);
                  // Center the location marker on the map and zoom the map to level 18.
                  _centerCurrentLocationStreamController!.add(18);
                },
                child: Icon(
                  Icons.my_location,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class FingerPrint extends StatefulWidget {
  AttendanceViewModel? model;
  FingerPrint({this.model});

  @override
  _FingerPrintState createState() => _FingerPrintState();
}

class _FingerPrintState extends State<FingerPrint>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation? _animation;

  bool showFingerPrint = false;
  bool isAnimationCompleted = false;
  @override
  void initState() {
    super.initState();

    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller!)
      ..addStatusListener((AnimationStatus status) {
        switch (status) {
          case AnimationStatus.forward:
            break;
          case AnimationStatus.completed:
            isAnimationCompleted = true;
            _controller!.reverse();
            break;
          case AnimationStatus.reverse:
            break;
          case AnimationStatus.dismissed:
            if (isAnimationCompleted) {
              setState(() {
                showFingerPrint = !showFingerPrint;
              });
              isAnimationCompleted = false;
            }
            break;
        }
      });
  }

  _onLongPressStart(LongPressStartDetails details) {
    if (!_controller!.isAnimating) {
      _controller!.forward();
    } else {
      _controller!.forward(from: _controller!.value);
    }
  }

  _onLongPressEnd(LongPressEndDetails details) {
    _controller!.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        //  color: Colors.blue,
      ),
      alignment: Alignment.center,
      child: Stack(
        children: <Widget>[
          GestureDetector(
            onLongPressStart: _onLongPressStart,
            onLongPressEnd: _onLongPressEnd,
            child: AnimatedBuilder(
                animation: _controller!,
                builder: (_, child) {
                  return Transform.scale(
                    scale: ((_controller!.value * 0.2) + 1),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.018,
                          bottom: MediaQuery.of(context).size.height * 0.018,
                          right: MediaQuery.of(context).size.height * 0.018,
                          left: MediaQuery.of(context).size.height * 0.018),
                      height: MediaQuery.of(context).size.height,
                      child: Stack(
                        children: <Widget>[
                          CircularProgres(value: _controller!.value),
                          Container(
                            child: showFingerPrint
                                ? Center(
                                    child: Icon(
                                      Icons.check_circle,
                                      color: Colors.greenAccent[700],
                                      size: MediaQuery.of(context).size.height *
                                          0.08,
                                    ),
                                  )
                                : FingerPrintIcon(value: _controller!.value),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        boxShadow: [
                          // BoxShadow(
                          //     color: Colors.blue[100]!,
                          //     blurRadius: 10,
                          //     spreadRadius: 3,
                          //     offset: Offset(16, 16)),
                        ],
                        //shape: BoxShape.circle,
                        color: Color(0xFFF3F3F5),
                      ),
                    ),
                  );
                }),
            onLongPress: () {
              widget.model!.register(context);
            },
          ),
        ],
      ),
    );
  }
}

class FingerPrintIcon extends StatelessWidget {
  final double? value;
  FingerPrintIcon({this.value});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Center(
          child: Shimmer.fromColors(
            direction: ShimmerDirection.btt,
            baseColor: Colors.blue,
            highlightColor: Colors.grey[200]!,
            child: Icon(
              Icons.fingerprint,
              color: Colors.blue,
              size: MediaQuery.of(context).size.height * 0.09,
            ),
          ),
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height * 0.002,
          child: ClipRect(
            child: Align(
              alignment: Alignment.bottomCenter,
              heightFactor: value,
              child: Icon(
                Icons.fingerprint,
                color: Colors.blue[900],
                size: MediaQuery.of(context).size.height * 0.09,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
