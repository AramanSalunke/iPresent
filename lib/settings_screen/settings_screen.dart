import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Settings_Screen extends StatefulWidget {
  @override
  _Settings_ScreenState createState() => _Settings_ScreenState();
}

class _Settings_ScreenState extends State<Settings_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xFFE7004C),
        title: Text(
          'Settings',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
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
              padding: const EdgeInsets.fromLTRB(145.0, 15.0, 145.0, 15.0),
            ),
          ],
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
