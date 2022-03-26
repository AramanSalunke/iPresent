import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ipresent/app/locator.dart';
import 'package:ipresent/splash_Screen/splash_screen.dart';
import 'package:ipresent/util/dialog_ui.dart';
import 'package:ipresent/util/snackbar_ui.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Color(0xFFE7004C)));
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //await FlutterConfig.loadEnvVariables();
  setupLocator();
  setupDialogUi();
  setupSnackbarUi();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'Flutter Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: Scaffold(body: SplashScreen()),
    );
  }
}
