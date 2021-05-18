import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ipresent/login/signinScreenWords.dart';
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
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Color(0xFFE7004)));
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
                            height: 100,
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
            child: Stack(children: [
              Container(
                height: MediaQuery.of(context).size.height * .8,
                width: MediaQuery.of(context).size.width,
                decoration: new BoxDecoration(
                  color: Color(0xFFF3F3F5),
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
              CustomPaint(
                size: Size(
                    MediaQuery.of(context).size.width,
                    (MediaQuery.of(context).size.width * 1.706493443080357)
                        .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                painter: RPSCustomPainter(),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.037,
                left: MediaQuery.of(context).size.width * 0.077,
                child: Container(
                  width: 330,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Color(0xFFF3F3F5).withOpacity(0.9),
                    borderRadius: BorderRadius.circular(40),
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
              Positioned(
                top: MediaQuery.of(context).size.height * 0.367,
                left: MediaQuery.of(context).size.width * 0.077,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      "assets/Settings_Icon.png",
                      height: 100,
                      width: 250,
                      fit: BoxFit.contain,
                    ),
                  ),
                  width: 140,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Color(0xFFF3F3F5).withOpacity(0.8),
                    borderRadius: BorderRadius.circular(30),
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
              Positioned(
                top: MediaQuery.of(context).size.height * 0.367,
                right: MediaQuery.of(context).size.width * 0.077,
                child: Container(
                  width: 140,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Color(0xFFF3F3F5).withOpacity(0.8),
                    borderRadius: BorderRadius.circular(30),
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
              Positioned(
                top: MediaQuery.of(context).size.height * 0.547,
                left: MediaQuery.of(context).size.width * 0.077,
                child: Container(
                  width: 140,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Color(0xFFF3F3F5).withOpacity(0.8),
                    borderRadius: BorderRadius.circular(30),
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
              Positioned(
                top: MediaQuery.of(context).size.height * 0.547,
                right: MediaQuery.of(context).size.width * 0.077,
                child: Container(
                  width: 140,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Color(0xFFF3F3F5).withOpacity(0.8),
                    borderRadius: BorderRadius.circular(30),
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
            ]),
          ),
        ],
      )),
    );
  }
}
