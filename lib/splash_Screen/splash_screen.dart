import 'package:flutter/material.dart';
import 'package:ipresent/splash_Screen/splash_screen_model.dart';
import 'package:stacked/stacked.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashScreenModel>.reactive(
      viewModelBuilder: () => SplashScreenModel(),
      onModelReady: (model) => model.startupLogic(context),
      builder: (context, model, child) => WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(),
                CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation(
                    Color(0xfff00000),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
