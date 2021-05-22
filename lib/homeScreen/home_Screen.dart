import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:ipresent/login/footer_Signin.dart';
import 'package:ipresent/login/signinScreenWords.dart';
import 'package:ipresent/settings_screen/settings_screen.dart';
import 'package:ipresent/shapes/shapes.dart';

//import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
class HomeScreen extends StatefulWidget {
  final Color? backgroundColor;
  final String? logo;

  const HomeScreen({this.backgroundColor, this.logo});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SigninScreenWords? signinScreenWords;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                      topLeft: const Radius.circular(50.0),
                      topRight: const Radius.circular(50.0),
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
                        (MediaQuery.of(context).size.width * 1.706493443080357)
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
                                top: MediaQuery.of(context).size.height * 0.03),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.87,
                              height: MediaQuery.of(context).size.height * 0.35,
                              decoration: BoxDecoration(
                                color: Color(0xFFF3F3F5).withOpacity(0.9),
                                borderRadius: BorderRadius.circular(50),
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
                          NeumorphicButton(
                            onPressed: () {
                              print("onClick");
                            },
                            style: NeumorphicStyle(
                              shadowLightColor: Colors.black45,
                              color: Color(0xFFF3F3F5).withOpacity(0.8),
                              shape: NeumorphicShape.concave,
                              boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(30)),
                            ),
                            padding: EdgeInsets.fromLTRB(
                                MediaQuery.of(context).size.width * 0.084,
                                MediaQuery.of(context).size.height * 0.02,
                                MediaQuery.of(context).size.width * 0.084,
                                MediaQuery.of(context).size.height * 0.02),
                            child: Column(
                              children: [
                                Center(
                                  child: Image.asset(
                                    'assets/history.png',
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                    width: MediaQuery.of(context).size.height *
                                        0.1,
                                  ),
                                ),
                                Text(
                                  'History',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.orange[700],
                                  ),
                                )
                              ],
                            ),
                          ),
                          NeumorphicButton(
                            margin: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.04),
                            onPressed: () {
                              print("onClick");
                            },
                            style: NeumorphicStyle(
                              shadowLightColor: Colors.black45,
                              color: Color(0xFFF3F3F5).withOpacity(0.8),
                              shape: NeumorphicShape.concave,
                              boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(30)),
                            ),
                            padding: EdgeInsets.fromLTRB(
                                MediaQuery.of(context).size.width * 0.084,
                                MediaQuery.of(context).size.height * 0.02,
                                MediaQuery.of(context).size.width * 0.084,
                                MediaQuery.of(context).size.height * 0.02),
                            child: Column(
                              children: [
                                Center(
                                  child: Image.asset(
                                    'assets/notification_bell.png',
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                    width: MediaQuery.of(context).size.height *
                                        0.1,
                                  ),
                                ),
                                Text(
                                  'Notification',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.orange[700],
                                  ),
                                )
                              ],
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
                          NeumorphicButton(
                              onPressed: () {
                                print("onClick");
                              },
                              style: NeumorphicStyle(
                                shadowLightColor: Colors.black45,
                                color: Color(0xFFF3F3F5).withOpacity(0.8),
                                shape: NeumorphicShape.concave,
                                boxShape: NeumorphicBoxShape.roundRect(
                                    BorderRadius.circular(30)),
                              ),
                              padding: EdgeInsets.fromLTRB(
                                  MediaQuery.of(context).size.width * 0.084,
                                  MediaQuery.of(context).size.height * 0.02,
                                  MediaQuery.of(context).size.width * 0.084,
                                  MediaQuery.of(context).size.height * 0.02),
                              child: Column(
                                children: [
                                  Center(
                                    child: Icon(
                                      Icons.dashboard_rounded,
                                      color: Colors.orange[800],
                                      size: MediaQuery.of(context).size.height *
                                          0.1,
                                    ),
                                  ),
                                  Text(
                                    'Dashboard',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.orange[700],
                                    ),
                                  )
                                ],
                              )),
                          NeumorphicButton(
                            margin: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.04),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_buildContest) =>
                                      Settings_Screen()));
                              print("onClick");
                            },
                            style: NeumorphicStyle(
                              shadowLightColor: Colors.black45,
                              color: Color(0xFFF3F3F5).withOpacity(0.8),
                              shape: NeumorphicShape.concave,
                              boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(30)),
                            ),
                            padding: EdgeInsets.fromLTRB(
                                MediaQuery.of(context).size.width * 0.084,
                                MediaQuery.of(context).size.height * 0.02,
                                MediaQuery.of(context).size.width * 0.084,
                                MediaQuery.of(context).size.height * 0.02),
                            child: Column(
                              children: [
                                Center(
                                  child: Image.asset(
                                    'assets/settings.png',
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                    width: MediaQuery.of(context).size.height *
                                        0.1,
                                  ),
                                ),
                                Text(
                                  'Settings',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.orange[700],
                                  ),
                                )
                              ],
                            ),
                          ),
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
        ],
      )),
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
