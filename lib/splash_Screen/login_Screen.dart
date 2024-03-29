import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ipresent/app/locator.dart';
import 'package:ipresent/login/sign_In.dart';
import 'package:ipresent/login/resetPassword.dart';
import 'package:ipresent/login/sign_Up.dart';
import 'package:ipresent/models/sign_Up_model.dart';
import 'package:ipresent/login/signinScreen.dart';
import 'package:ipresent/login/footer_Signin.dart';
import 'package:ipresent/login/type_login.dart';
import 'package:ipresent/splash_Screen/splash_screen.dart';
import 'package:ipresent/util/snackbar_ui.dart';
import 'package:move_to_background/move_to_background.dart';

class LoginScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await SystemNavigator.pop();
        return false;
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // title: 'Flutter Demo',
        // theme: ThemeData(
        //   primarySwatch: Colors.blue,
        // ),
        home: Scaffold(body: buildSigninScreen()),
      ),
    );
  }

  SigninScreen buildSigninScreen() {
    List<SigninScreenTypeSignModel> listLogin = [
      SigninScreenTypeSignModel(
          callFunction: (BuildContext _buildContext) {},
          logo: TypeLogo.facebook),
      SigninScreenTypeSignModel(
          callFunction: (BuildContext _buildContext) {}, logo: TypeLogo.google),
      SigninScreenTypeSignModel(
          callFunction: (BuildContext _buildContext) {}, logo: TypeLogo.apple),
      SigninScreenTypeSignModel(
          callFunction: (BuildContext _buildContext) {
            Navigator.of(_buildContext).push(MaterialPageRoute(
              builder: (_buildContext) => widgetSigninUserPassword(),
            ));
          },
          logo: TypeLogo.userPassword),
    ];
    return SigninScreen(
      pathLogo: 'assets/mlogo.png',
      isExploreApp: true,
      functionExploreApp: () {},
      isFooter: true,
      widgetFooter: this.widgetFooter(),
      typeSigninModel: listLogin,
      isSignUp: true,
      widgetSignUp: this.widgetSigninScreenSignUP(),
    );
  }

  Widget widgetFooter() {
    return SigninScreenFooter(
      logo: 'assets/logo_footer.png',
      text: 'Powered by',
      funFooterLogin: () {},
    );
  }

  Widget widgetSigninScreenSignUP() {
    return SignUp(
      isFooter: true,
      widgetFooter: this.widgetFooter(),
      // logo: 'assets/logo_header.png',
      funSignUp:
          (BuildContext _context, Function isRequest, SignUpModel signUpModel) {
        isRequest(true);
        print(signUpModel.email);
        print(signUpModel.password);
        print(signUpModel.repeatPassword);
        print(signUpModel.surname);
        print(signUpModel.name);

        isRequest(false);
      },
    );
  }

  Widget widgetResetPassword() {
    return ResetPassword(
      logo: 'assets/logo_header.png',
      funResetPassword:
          (BuildContext _context, Function isRequest, String email) {
        isRequest(true);
        Future.delayed(Duration(seconds: 2), () {
          isRequest(false);
        });
      },
      isFooter: true,
      widgetFooter: this.widgetFooter(),
    );
  }

  Widget widgetSigninUserPassword() {
    return SigninUserAndPassword(
      callLogin: (BuildContext _context, Function isRequest, String user,
          String password) {
        isRequest(true);
        Future.delayed(Duration(seconds: 2), () {
          isRequest(false);
        });
      },
      logo: 'assets/logo_header.png',
      isFooter: true,
      widgetFooter: this.widgetFooter(),
      isResetPassword: true,
      widgetResetPassword: this.widgetResetPassword(),
      isSignUp: true,
      signUp: this.widgetSigninScreenSignUP(),
    );
  }
}
