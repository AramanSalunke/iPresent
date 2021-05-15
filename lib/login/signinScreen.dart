import 'package:flutter/material.dart';
import 'package:ipresent/login/footer_Signin.dart';

import 'package:ipresent/login/sign_Up.dart';
import 'package:ipresent/login/signinScreenWords.dart';
import 'package:ipresent/login/type_login.dart';

class SigninScreen extends StatefulWidget {
  final Color? backgroundColor;
  final String? pathLogo;
  final Color? cardColor;
  final Color? textColor;
  final bool? isFooter;
  final Widget? widgetSignUp;
  final Widget? widgetFooter;
  final bool? isExploreApp;
  final Function()? functionExploreApp;
  final bool? isSignUp;
  final List<SigninScreenTypeSignModel>? typeSigninModel;

  SigninScreenWords? keyWord;
  SigninScreen(
      {this.backgroundColor,
      this.pathLogo,
      this.cardColor,
      this.keyWord,
      this.textColor,
      this.typeSigninModel,
      this.isFooter,
      this.widgetSignUp,
      this.widgetFooter,
      this.isExploreApp,
      this.functionExploreApp,
      this.isSignUp});
  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  @override
  Widget build(BuildContext context) {
    widget.keyWord = widget.keyWord ?? SigninScreenWords();
    return Stack(
      children: [
        Container(
          color: widget.backgroundColor ?? Color(0xFFE7004C),
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.45,
              width: MediaQuery.of(context).size.width * 0.60,
              child: Center(
                child: Image.asset(
                  widget.pathLogo!,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.55,
            width: MediaQuery.of(context).size.width,
            decoration: new BoxDecoration(
                color: widget.cardColor ?? Color(0xFFF3F3F5),
                borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(50.0),
                  topRight: const Radius.circular(50.0),
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(),
                Column(
                  children: [
                    buildLoginWith(),
                    buildTypeLogin(context),
                    (widget.isExploreApp == null ||
                            widget.isExploreApp == false)
                        ? SizedBox()
                        : SizedBox(
                            height: 20,
                          ),
                    buildExploreApp(context),
                    (widget.isSignUp == null || widget.isSignUp == false)
                        ? SizedBox()
                        : buildSignUp(),
                  ],
                ),
                widget.widgetFooter!
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget buildExploreApp(BuildContext context) {
    return (widget.isExploreApp == null || widget.isExploreApp == false)
        ? SizedBox()
        : GestureDetector(
            onTap: widget.functionExploreApp,
            child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
                width: (widget.typeSigninModel!.length > 3)
                    ? MediaQuery.of(context).size.width * 0.90
                    : MediaQuery.of(context).size.width * 0.80,
                child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Center(
                          child: Text(
                        widget.keyWord!.exploreApp,
                        style: TextStyle(
                            color: widget.textColor ?? Color(0xFF0F2E48),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      )),
                    ))),
          );
  }

  GestureDetector buildSignUp() {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(
                text: widget.keyWord!.notAccount + '\n',
                style: TextStyle(
                    color: widget.textColor ?? Color(0xFF0F2E48),
                    fontWeight: FontWeight.normal,
                    fontSize: 15)),
            TextSpan(
                text: widget.keyWord!.signUp,
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: widget.textColor ?? Color(0xFF0F2E48),
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
          ]),
        ),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_buildContext) => SignUp(
                  logo: 'assets/logo_header.png',
                  widgetFooter: widgetFooter(),
                )));
      },
    );
  }

  Widget widgetFooter() {
    return SigninScreenFooter(
      logo: 'assets/logo_footer.png',
      text: 'Powered by',
      funFooterLogin: () {},
    );
  }

  Padding buildLoginWith() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(widget.keyWord!.loginWith,
          style: TextStyle(
              color: widget.textColor ?? Color(0xFF0F2E48),
              fontSize: 16,
              fontWeight: FontWeight.bold)),
    );
  }

  SizedBox buildTypeLogin(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.1,
      width: (widget.typeSigninModel!.length > 3)
          ? MediaQuery.of(context).size.width * 0.90
          : MediaQuery.of(context).size.width * 0.80,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: this.getCardLogin()),
        ),
      ),
    );
  }

  List<Widget> getCardLogin() {
    List<Widget> list = [];
    for (SigninScreenTypeSignModel tlm in widget.typeSigninModel!) {
      list.add(GestureDetector(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image(
              image: ExactAssetImage(
                tlm.logo!,
                package:
                    (tlm.logo!.contains('signinScreen')) ? 'assets/' : null,
              ),
            ),
          ),
          onTap: () {
            tlm.callFunction(context);
          }));
    }
    return list;
  }
}
