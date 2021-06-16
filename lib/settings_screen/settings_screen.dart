import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:ipresent/constants/custom_appbar.dart';

class Settings_Screen extends StatefulWidget {
  @override
  _Settings_ScreenState createState() => _Settings_ScreenState();
}

class _Settings_ScreenState extends State<Settings_Screen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[350],
      appBar: CustomAppBar(
        title: "Settings",
        child: Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
        child: Center(
          child: Column(
            children: [
              NeumorphicButton(
                child: Text(
                  'Log Out',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                onPressed: () {
                  print("onClick");
                },
                style: NeumorphicStyle(
                  shadowLightColor: Colors.black45,
                  color: Color(0xFFF3F3F5).withOpacity(0.8),
                  shape: NeumorphicShape.concave,
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
                ),
                padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.35,
                  MediaQuery.of(context).size.height * 0.02,
                  MediaQuery.of(context).size.width * 0.35,
                  MediaQuery.of(context).size.height * 0.02,
                ),
              ),
            ],
          ),
        ),
      ),
      // Container(
      //   height: MediaQuery.of(context).size.height,
      //   width: MediaQuery.of(context).size.width,
      //   color: Colors.grey[400],
      //   child: Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child:
      //   ),
      // ),
    );
  }
}
